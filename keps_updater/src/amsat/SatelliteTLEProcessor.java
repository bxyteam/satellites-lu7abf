package amsat;

import java.io.*;
import java.net.*;
import java.util.*;
import java.util.stream.Collectors;

public class SatelliteTLEProcessor {
    public String basePath;
    private List<String> omitList;
    private Set<String> catalogNumbers;
    private Map<Integer, String[]> stkeps;
    private StringBuilder kepsnew;
    private StringBuilder alljs;
    private StringBuilder nasajs;
    private String kepsdate;
     
    public SatelliteTLEProcessor(String basePath) {
      this.basePath = basePath;	
      this.omitList = new ArrayList<>();
      this.catalogNumbers = new HashSet<>();
      this.stkeps = new HashMap<>();
      this.kepsnew = new StringBuilder();
      this.alljs = new StringBuilder("alljs=[\r\n");
      this.nasajs = new StringBuilder("PLib.tleData=[\r\n");
      this.kepsdate = "";
    }
    
    public void processSatelliteData() {
        try {

            this.stkeps = SpacetrackProcessor.processSpacetrackMap(basePath); 
            
            // Fetch data from URLs
            String amsatna = getURL("https://www.amsat.org/tle/current/nasabare.txt");
            amsatna = amsatna.replace("\n", "\r\n"); // equivalent to replace(amsatna,vbLf,vbCrLf,1,26000,1)
            String amateur = getURL("http://www.celestrak.org/NORAD/elements/gp.php?GROUP=amateur&FORMAT=tle");
            String weather = getURL("http://www.celestrak.org/NORAD/elements/gp.php?GROUP=noaa&FORMAT=tle");
            String education = getURL("http://www.celestrak.org/NORAD/elements/gp.php?GROUP=noaa&FORMAT=tle");
            String newsat = getURL("http://www.celestrak.org/NORAD/elements/gp.php?GROUP=last-30-days&FORMAT=tle");
            String cubesat = getURL("http://www.celestrak.org/NORAD/elements/gp.php?GROUP=cubesat&FORMAT=tle");
      
            // Process space track data
            String spacet = processSpaceTrackData();
            List<String> spacem =Arrays.asList(spacet.split("\n"));
            String addnewsats = "";
            
            for (int k = 0; k < spacem.size(); k++) {
                if (spacem.get(k).length() < 30 && spacem.get(k).length() > 1) {
                    spacem.set(k, spacem.get(k).replaceAll("0 ", ""));
                }
                if (spacem.get(k).startsWith("OBJECT") && k + 1 < spacem.size()) {
                    String LI0 = getSat(spacem.get(k + 1).substring(2, 7));
                    if (!LI0.isEmpty()) {
                        spacem.set(k, LI0);
                    }
                }
            }
            
            // Rebuild spacet string
            for (String line : spacem) {
                addnewsats += line + "\r\n";
            }
            
            String moons = MoonKepsProcessor.processMoonKepsWithLists(this.basePath, DateFormatter.getYYDDDFormatted());
            String localsat = moons + LocalKepsProcessor.processLocalKepsStreams(this.basePath);
            
            // Combine all satellite data
            if (amateur.length() > 1000 && weather.length() > 100) {
                String keplers = exclude(amateur + cubesat + weather + newsat + education + amsatna);
                keplers = localsat.toUpperCase() + "\r\n" + keplers + 
                         addnewsats.replace("1  7530", "1 07530").replace("2 07530", "2 07530");
                
                // Clean up line breaks
                keplers = keplers.replaceAll("\n\n", "\n")
                                .replaceAll("\r\n\r\n", "\r\n")
                                .replaceAll("\r\r", "\r");
                
                // Sort keplers by catalog number
                processSortedKeplers(keplers);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }
    
    public String getURL(String url) throws IOException {
    	System.out.println("[ URL ] " + url);
        URL urlObj = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) urlObj.openConnection();
        connection.setRequestMethod("GET");
        connection.setConnectTimeout(5000);
        connection.setReadTimeout(10000);
        
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(connection.getInputStream()))) {
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line).append("\n");
            }
            return response.toString();
        } catch (Exception e) {
        	System.err.println("url no found " + url);
			return "";
		}
    }
    
    public String translateSat(String sat) {
        if (sat == null) return null;
        
        String normalizedSat = sat.trim().toUpperCase()
                                 .replaceAll("\t", "")
                                 .replaceAll("  +", " ");
        
        for (int i = 0; i < SatelliteUpdateProcessor.ACCEPTED_SATELLITES.length; i++) {
            if (normalizedSat.equals(SatelliteUpdateProcessor.ACCEPTED_SATELLITES[i].toUpperCase())) {
                return SatelliteUpdateProcessor.ACCEPTED_TRANSLATIONS[i];
            }
        }
        return null;
    }
    
    public String searchTag(String startTag, String endTag, String text, int startPosition) {
        if (text == null || startPosition >= text.length()) {
            return "";
        }
        
        int startIndex = text.indexOf(startTag, startPosition);
        if (startIndex == -1) {
            return "";
        }
        
        int contentStart = startIndex + startTag.length();
        int endIndex = text.indexOf(endTag, contentStart);
        if (endIndex == -1) {
            return "";
        }
        
        return text.substring(contentStart, endIndex);
    }
    
    public String getSat(String catNo) throws IOException {
        String urlCat = "http://celestrak.org/NORAD/elements/gp.php?CATNR=" + catNo;
        String kepCat = getURL(urlCat);
        
        String cleaned = kepCat.replaceAll("<pre>", "")
                               .replaceAll("</pre>", "");
        
        if (cleaned.length() > 60) {
            String[] lines = cleaned.split("\r?\n");
            if (lines.length >= 3) {
                String line0 = lines[0].trim();
                String line1 = lines[1].trim();
                String line2 = lines[2].trim();
                return "\r\n" + line0 + "\r\n" + line1 + "\r\n" + line2 + "\r\n";
            }
        }
        
        return "";
    }
    
    public String replaceKeps(String keplers, String satName, String L1, String L2) {
        if (keplers == null) return "";
        
        StringBuilder result = new StringBuilder();
        String[] lines = keplers.split("\r?\n");
        
        for (int i = 0; i < lines.length - 2; i += 3) {
            if (i + 2 < lines.length) {
                String line0 = lines[i].trim();
                String line1 = lines[i + 1].trim();
                String line2 = lines[i + 2].trim();
                
                if (line0.startsWith(satName)) {
                    result.append(line0).append("\r\n");
                    result.append(L1).append("\r\n");
                    result.append(L2).append("\r\n");
                } else {
                    result.append(line0).append("\r\n");
                    result.append(line1).append("\r\n");
                    result.append(line2).append("\r\n");
                }
            }
        }
        
        return result.toString();
    }
    
    public String fixCrc(String newNumber, String line) {
        if (newNumber == null || newNumber.isEmpty()) {
            newNumber = line.substring(2, 7);
        }
        
        // Replace catalog number
        String modifiedLine = line.substring(0, 2) + newNumber + line.substring(7, line.length() - 1);
        
        // Calculate checksum
        int checksum = 0;
        for (char c : modifiedLine.toCharArray()) {
            if (Character.isDigit(c)) {
                checksum += Character.getNumericValue(c);
            } else if (c == '-') {
                checksum += 1;
            }
        }
        
        int crc = checksum % 10;
        return modifiedLine + crc;
    }
    
    public boolean checkSat(String sat) {
        if (sat == null) return false;
        
        String cleanSat = sat.replaceAll("\r", "")
                            .replaceAll("\n", "")
                            .trim();
        
        for (String acceptedSat : SatelliteUpdateProcessor.ACCEPTED_SATELLITES) {
            if (cleanSat.equalsIgnoreCase(acceptedSat.trim())) {
                return true;
            }
        }
        
        return cleanSat.equalsIgnoreCase("TITA)");
    }
    
    public String exclude(String satTxt) {
        if (satTxt == null) return "";
        
        List<String> satLines = Arrays.asList(satTxt.split("\r?\n"));
        StringBuilder result = new StringBuilder();
        catalogNumbers.clear();
        
        for (int i = 0; i < satLines.size() - 2; i += 3) {
            if (i + 2 >= satLines.size()) break;
            
            String line0 = satLines.get(i).replaceAll("\r", "").replaceAll("\n", "").trim();
            String line1 = satLines.get(i + 1);
            String line2 = satLines.get(i + 2);
            
            boolean include = true;
            
            // Check omit list
            for (String omitItem : omitList) {
                if (line0.toUpperCase().startsWith(omitItem.toUpperCase()) ||
                    line0.toLowerCase().contains(omitItem.toLowerCase())) {
                    include = false;
                    break;
                }
            }
            
            // Get catalog number and check for duplicates
            String catalogNumber = line1.substring(2, 7);
            if (catalogNumbers.contains(catalogNumber)) {
                include = false;
            }
            
            if (include) {
                catalogNumbers.add(catalogNumber);
                
                // Apply specific catalog number changes
                if ("90720".equals(catalogNumber)) {
                    line1 = fixCrc("40652", line1);
                    line2 = fixCrc("40652", line2);
                }
                if ("90729".equals(catalogNumber)) {
                    line1 = fixCrc("40661", line1);
                    line2 = fixCrc("40661", line2);
                }
                if ("99999".equals(catalogNumber)) {
                    line1 = fixCrc("99999", line1);
                    line2 = fixCrc("99999", line2);
                }
                
                // Handle orbit number adjustments for specific satellites
                if ("40967".equals(line2.substring(2, 7))) {
                    int orbitNumber = Integer.parseInt(line2.substring(63, 68).trim()) + 9125;
                    String newOrbitNumber = String.format("%05d", orbitNumber);
                    line2 = line2.substring(0, 63) + newOrbitNumber + line2.substring(68, 69);
                    line2 = fixCrc("40967", line2);
                }
                
                if ("40654".equals(line2.substring(2, 7))) {
                    int orbitNumber = Integer.parseInt(line2.substring(63, 68).trim()) + 9125;
                    String newOrbitNumber = String.format("%05d", orbitNumber);
                    line2 = line2.substring(0, 63) + newOrbitNumber + line2.substring(68, 69);
                    line2 = fixCrc("40654", line2);
                }
                
                result.append(line0).append("\r\n");
                result.append(line1.replace("n", " ")).append("\r\n");
                result.append(line2).append("\r\n");
            }
        }
        
        return result.toString();
    }
    
    public void setOmitList(List<String> omitList) {
        this.omitList = omitList != null ? omitList : new ArrayList<>();
    }

    private String processSpaceTrackData() throws IOException {
    	List<String> spaceLines = SpacetrackProcessor.processSpacetrackLines(this.basePath);
        StringBuilder additionalNewSats = new StringBuilder();
        
        for (int i = 0; i < spaceLines.size(); i++) {
            String line = spaceLines.get(i);
            
            if (line.length() < 30 && line.length() > 1) {
                line = line.replaceAll("0 ", "");
            }
            
            if (line.startsWith("OBJECT") && i + 1 < spaceLines.size()) {
                String catalogNumber = spaceLines.get(i + 1).substring(2, 7);
                String satData = getSat(catalogNumber);
                //String satData = "";
                if (!satData.isEmpty()) {
                   line = satData.split("\n")[1];
                }
            }
            
            additionalNewSats.append(line).append("\r\n");
        }
        
        return additionalNewSats.toString()
                              .replace("1  7530", "1 07530")
                              .replace("2 07530", "2 07530");
    }
    
    private boolean isNumeric(String str) {
        try {
            Integer.parseInt(str.trim());
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
    
    private void processSortedKeplers(String keplers) {
        List<String> kepsmat =Arrays.asList(keplers.split("\r\n"));
        
        // Create catalog matrix for sorting
        List<CatalogEntry> catalogList = new ArrayList<>();
        
        for (int m = 1; m < kepsmat.size(); m += 3) {
            if (m < kepsmat.size() && kepsmat.get(m).length() >= 7) {
                String catNumStr = kepsmat.get(m).substring(2, 7);
                if (isNumeric(catNumStr)) {
                    catalogList.add(new CatalogEntry(Integer.parseInt(catNumStr.trim()), m / 3));
                }
            }
        }
        
        // Sort by catalog number and remove duplicates
        catalogList = catalogList.stream()
                .collect(Collectors.groupingBy(CatalogEntry::getCatalogNumber))
                .values().stream()
                .map(list -> list.get(0)) // Keep first occurrence
                .sorted(Comparator.comparing(CatalogEntry::getCatalogNumber))
                .collect(Collectors.toList());
        
        // Process sorted catalog entries
        
        for (CatalogEntry entry : catalogList) {
            int catalogNumber = entry.getCatalogNumber();
            int index = entry.getIndex();
            
            // Add name line
            kepsnew.append(kepsmat.get(index * 3)).append("\r\n");
            
            // Safely get TLE lines
            String line1 = (index * 3 + 1 < kepsmat.size()) ? kepsmat.get(index * 3 + 1) : "";
            String line2 = (index * 3 + 2 < kepsmat.size()) ? kepsmat.get(index * 3 + 2) : "";
            
            if (line1.length() >= 32) {
                String epochCurrent = line1.substring(18, 32);
                String epochStored = "";
                
                // Check if we have stored data for this catalog number
                if (stkeps.containsKey(catalogNumber) && 
                    stkeps.get(catalogNumber)[0] != null &&
                    stkeps.get(catalogNumber)[0].length() >= 32) {
                    
                    epochStored = stkeps.get(catalogNumber)[0].substring(18, 32);
                    
                    // Use stored data if it's newer
                    if (!epochStored.isEmpty() && epochCurrent.compareTo(epochStored) < 0) {
                        // Fix malformed 7530 satellite lines
                        String storedLine1 = stkeps.get(catalogNumber)[0];
                        String storedLine2 = stkeps.get(catalogNumber)[1];
                        
                        if (storedLine1.startsWith("1  7530")) {
                            storedLine1 = "1 07530" + storedLine1.substring(7);
                        }
                        if (storedLine2.startsWith("2  7530")) {
                            storedLine2 = "2 07530" + storedLine2.substring(7);
                        }
                        
                        kepsnew.append(storedLine1).append("\r\n");
                        kepsnew.append(storedLine2).append("\r\n");
                        
                        // Add to alljs
                        addToAllJs(kepsmat.get(index * 3).trim(), storedLine1, storedLine2);
                    } else {
                        // Use current lines
                        kepsnew.append(line1).append("\r\n");
                        kepsnew.append(line2).append("\r\n");
                        
                        // Add to alljs
                        addToAllJs(kepsmat.get(index * 3).trim(), line1, line2);
                    }
                } else {
                    // No stored data - use current lines
                    kepsnew.append(line1).append("\r\n");
                    kepsnew.append(line2).append( "\r\n");
                    
                    // Add to alljs
                    addToAllJs(kepsmat.get(index * 3).trim(), line1, line2);
                }
                
                // Update latest epoch
                if (epochCurrent.substring(0, 2).compareTo("80") < 0 && 
                    epochCurrent.compareTo(kepsdate) > 0) {
                    kepsdate = epochCurrent;
                }
                
                // Add to nasa.js if selected (you'll need to implement checksat method)
                if (checkSat(kepsmat.get(index * 3).trim())) {
                    // Add to nasajs - similar to alljs logic
                    addToNasaJs(kepsmat.get(index * 3).trim(), line1, line2, epochCurrent, epochStored, catalogNumber);
                }
            }
        }
        
        // Close alljs array
        alljs.append("];\r\n");
        
        nasajs.append("[\r\n")
         .append(" \"MOON\",\r\n")
         .append(" \"1 01601U 00000    15352.96009176  .00000000  00000-0  10000-3 0 00009\",\r\n")
         .append(" \"2 01601 018.3070 001.0121 0448000 011.0732 349.8866  0.03660099000001\"\r\n")
         .append("]\r\n")
         .append("];\r\n");
        
         sanitizeJs();
    }

	private void addToAllJs(String name, String line1, String line2) {
        alljs.append("[\r\n")
         .append(" \"" + name + "\",\r\n")
         .append(" \"" + line1 + "\",\r\n")
         .append(" \"" + line2 + "\"\r\n")
         .append("],\r\n");
    }
    
    private void addToNasaJs(String name, String line1, String line2, 
                           String epochCurrent, String epochStored, int catalogNumber) {
        nasajs.append("[\r\n")
          .append(" \"" + translateSat(name) + "\",\r\n"); // You'll need to implement translateSat
        
        if (stkeps.containsKey(catalogNumber) && 
            !epochStored.isEmpty() && epochCurrent.compareTo(epochStored) < 0) {
            nasajs.append(" \"" + stkeps.get(catalogNumber)[0] + "\",\r\n")
              .append(" \"" + stkeps.get(catalogNumber)[1] + "\"\r\n");
        } else {
            nasajs.append(" \"" + line1 + "\",\r\n")
              .append(" \"" + line2 + "\"\r\n");
        }
        
        nasajs.append("],\r\n");
    }
    
    
    private void sanitizeJs() {
       StringBuilder alljsSanitized = TleCleaner.sanitize(alljs, "alljs=[\n");
       StringBuilder nasajsSanitized = TleCleaner.sanitize(nasajs, "PLib.tleData=[\n");
       this.alljs.setLength(0);
       this.nasajs.setLength(0);      
       this.alljs.append(alljsSanitized);
       this.nasajs.append(nasajsSanitized);
	}
  
    public void setSpaceTrackKeps(Map<Integer, String[]> spaceTrackKeps) {
        this.stkeps = spaceTrackKeps != null ? spaceTrackKeps : new HashMap<>();
    }
    
   
    public String getKepsNew() { return kepsnew.toString(); }
    public String getAllJs() { return alljs.toString(); }
    public String getNasaJs() { return nasajs.toString(); }
    public String getKepsDate() { return kepsdate.toString(); }
    public Map<Integer, String[]> getStkeps() { return stkeps; }
    
    // Inner class for catalog entries
    private static class CatalogEntry {
        private final int catalogNumber;
        private final int index;
        
        public CatalogEntry(int catalogNumber, int index) {
            this.catalogNumber = catalogNumber;
            this.index = index;
        }
        
        public int getCatalogNumber() { return catalogNumber; }
        public int getIndex() { return index; }
    }
   
}

