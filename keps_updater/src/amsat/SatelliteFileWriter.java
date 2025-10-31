package amsat;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.HashMap;
import java.util.Map;

public class SatelliteFileWriter {
    
    private final String basePath;
    private final String outPath;
    
    private String strack;
    private String strack1;
    
    // Satellite name replacement arrays (equivalent to aceptsat and acepttra)
    private Map<String, String> satelliteReplacements = new HashMap<>();
    
    public SatelliteFileWriter(String customBasePath) {
        this.basePath = customBasePath;
        this.outPath = Paths.get(basePath, "output").toString() + File.separator;
        this.strack = "";
        this.strack1 = "";
        createTextDirectory();
    }
    
    private void createTextDirectory() {
        try {
            Path outDir = Paths.get(outPath);
            if (!Files.exists(outDir)) {
                Files.createDirectories(outDir);
            }
        } catch (IOException e) {
            System.err.println("Error creating text directory: " + e.getMessage());
        }
    }
    
    public void saveAllSatelliteFiles(String keplers, String nasajs, String alljs, String kepsdate) {
        try {
            // Process keplers with name changes
            String keplersChanged = processKeplersNameChanges(keplers);
            
            // Save keplers to multiple files
            saveKeplersFiles(keplersChanged);
            
            // Save JavaScript files
            saveNasaJs(nasajs);
            saveAllJs(alljs);
            
            // Save  kepsdate file
            saveKepsDate(kepsdate);
            
            // Save space-track URLs
            saveSpaceTrackUrls();
            
            System.out.println("All satellite files saved successfully to: " + outPath);
            
        } catch (Exception e) {
            System.err.println("Error saving satellite files: " + e.getMessage());
            e.printStackTrace();
            System.exit(1);
        }
    }
    
    private String processKeplersNameChanges(String keplers) {
        String keplersChanged = keplers;
        
        // Apply standard name changes (equivalent to ASP replace operations)
        keplersChanged = keplersChanged.replaceAll("NOAA ", "NOAA-");
        keplersChanged = keplersChanged.replaceAll("METEOR-M ", "METEOR-M-");
        keplersChanged = keplersChanged.replaceAll("O3B ", "O3B-");
        keplersChanged = keplersChanged.replaceAll("GOES ", "GOES-");
        keplersChanged = keplersChanged.replaceAll("TANYUSHA ", "TANYUSHA-");
        keplersChanged = keplersChanged.replaceAll("TianYi ", "TianYi-");
        keplersChanged = keplersChanged.replaceAll("VELOX ", "VELOX-");
        
        // Apply custom satellite name replacements
        for (Map.Entry<String, String> replacement : satelliteReplacements.entrySet()) {
            keplersChanged = keplersChanged.replaceAll(replacement.getKey(), replacement.getValue());
        }
        
        return keplersChanged;
    }
    
    private void saveKeplersFiles(String keplersChanged) throws IOException {
        // Save to nasa.all
        writeToFile(outPath + "nasa.all", keplersChanged);
        
        // Save to nasa.txt
        writeToFile(outPath + "nasa.txt", keplersChanged);
        
        // Save to keps.txt
        writeToFile(outPath + "keps.txt", keplersChanged);
    }
    
    private void saveNasaJs(String nasajs) throws IOException {
        writeToFile(outPath + "nasa.js", nasajs);
    }
    
    private void saveAllJs(String alljs) throws IOException {
        // Save original all.js
        writeToFile(outPath + "all.js", alljs);
           
        // Create alljs JSON
        StringBuilder allJson = new StringBuilder();
        String cleaned = alljs.toString()
        	          .replace("alljs=", "")  
        			  .replace("];", "]")   
        	          .replaceAll(",\\s*\\]$", "]"); 
      
        allJson.append(cleaned);
       	 
        writeToFile(outPath + "all.json", allJson.toString());
        
        // Create compressed version (alljs1)
        String alljs1 = createCompressedAllJs(alljs);
        // You can save alljs1 to another file if needed
        writeToFile(outPath + "all.compressed.js", alljs1);
    }
    
    private String createCompressedAllJs(String alljs) {
        String alljs1 = alljs;
        
        // Replace double quotes with single quotes
        alljs1 = alljs1.replace("\"", "'");
        
        // Remove line breaks
        alljs1 = alljs1.replace("\r\n", "");
        alljs1 = alljs1.replace("\n", "");
        
        // Compress spacing
        alljs1 = alljs1.replace("', '", "','");
        alljs1 = alljs1.replace("[ ", "[");
        alljs1 = alljs1.replace(" [", "[");
        
        return alljs1;
    }
    
    private void saveKepsDate(String kepsdate) throws IOException {
        String kepsDateFile = outPath + "kepsdate.txt";
        String oldKepsDate = "";
        
        try {
            oldKepsDate = readFile(kepsDateFile).trim();
        } catch (IOException e) {
            // File doesn't exist, create it           
            writeToFile(kepsDateFile, kepsdate);
            oldKepsDate = "";
        }
        
        if (kepsdate.compareTo(oldKepsDate) > 0) {
            writeToFile(kepsDateFile, kepsdate);
            System.out.println("Updated kepsdate.txt with new date: " + kepsdate);
        }
        
    }
    
    public void saveSpaceTrackUrls() throws IOException {
        // Save space-track URL
        writeToFile(outPath + "spacetrack.txt", strack);
        
        // Save space-track1 URL
        writeToFile(outPath + "spacetrack1.txt", strack1);
    }
    
    private void writeToFile(String filePath, String content) throws IOException {
        Path path = Paths.get(filePath);
        
        // Create parent directories if they don't exist
        if (path.getParent() != null) {
            Files.createDirectories(path.getParent());
        }
        
        // Write content to file (equivalent to CreateTextFile with overwrite=True)
        Files.write(path, content.getBytes(StandardCharsets.UTF_8), 
                   StandardOpenOption.CREATE, 
                   StandardOpenOption.TRUNCATE_EXISTING);
    }
    
    // Method to add custom satellite name replacements
    public void addSatelliteReplacement(String original, String replacement) {
        satelliteReplacements.put(original, replacement);
    }
    
    // Method to load replacements from arrays (equivalent to aceptsat/acepttra)
    public void loadSatelliteReplacements(String[] originalNames, String[] replacementNames) {
        if (originalNames.length != replacementNames.length) {
            throw new IllegalArgumentException("Original and replacement arrays must have the same length");
        }
        
        for (int i = 0; i < originalNames.length; i++) {
            satelliteReplacements.put(originalNames[i], replacementNames[i]);
        }
    }
    
    // Individual file saving methods for more granular control
    public void saveKeplersToFile(String keplers, String fileName) throws IOException {
        String keplersChanged = processKeplersNameChanges(keplers);
        writeToFile(outPath + fileName, keplersChanged);
    }
    
    public void saveJavaScriptFile(String content, String fileName) throws IOException {
        writeToFile(outPath + fileName, content);
    }
    
    public String getSpaceTrackUrl() {
        return strack;
    }
    
    public String getSpaceTrack1Url() {
        return strack1;
    }
    
    public void setSpaceTrackUrl(String st) {
        strack = st;
    }
    
    public void setSpaceTrack1Url(String st1) {
        strack1 = st1;
    }
    
    
    public String getOutPath() {
        return outPath;
    }
    
    // Method to read existing file content (utility method)
    public String readFile(String fileName) throws IOException {
        Path filePath = Paths.get(outPath + fileName);
        if (Files.exists(filePath)) {
            return new String(Files.readAllBytes(filePath), StandardCharsets.UTF_8);
        }
        return "";
    }
    
    // Method to check if file exists
    public boolean fileExists(String fileName) {
        return Files.exists(Paths.get(outPath + fileName));
    }
}