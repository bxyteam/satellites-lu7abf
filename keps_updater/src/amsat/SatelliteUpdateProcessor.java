package amsat;

import java.util.List;
import java.util.stream.Collectors;

public class SatelliteUpdateProcessor {
    
	private String basePath;
    private SatelliteTLEProcessor processor;
    private SatelliteFileWriter fileWriter;
    
    public static final String[] ACCEPTED_SATELLITES = {
            "OSCAR 7 (AO-7)", "PACSAT (AO-16)", "LUSAT (LO-19)", "PHASE 3B (AO-10)",
            "UOSAT 2 (UO-11)", "ITAMSAT (IO-26)", "RADIO ROSTO (RS-15)", "JAS-2 (FO-29)",
            "ISS (ZARYA)", "PHASE 3D (AO-40)", "YUBILEINY (RS-30)", "AIST 1 (RS-41)",
            "AIST-2 (RS-43)", "PCSAT (NO-44)", "DELFI-C3 (DO-64)", "COSMOS 2499 (RS-47)",
            "CUBEBUG-2 (LO-74)", "SAUDISAT 1C (SO-50)", "CUTE-1 (CO-55)", "CUBESAT XI-IV (CO-57)",
            "CUBESAT XI-V (CO-58)", "MOZHAYETS 4 (RS-22)", "SEEDS II (CO-66)", "SUMBANDILA (SO-67)",
            "TIANWANG 1C (TW-1C)", "TIANWANG 1B (TW-1B)", "TIANWANG 1A (TW-1A)", "ARSAT 1",
            "ARSAT 2", "FIREBIRD 3", "FIREBIRD 4", "LAPAN-A2 (IO-86)", "HOPE-1 (HO-68)",
            "AIST-2D (RS-48)", "NUSAT 1 (LO-87)", "AUBIESAT-1 (AO-71)", "DELFI-N3XT",
            "FUNCUBE-1 (AO-73)", "FUNCUBE-3 (EO-79)", "LILACSAT 2", "BUGSAT-1 (TITA)",
            "QB50P1", "QB50P2", "SPROUT", "CUTE-1.7+APD II (CO-65)", "ATHENOXAT 1",
            "TECHSAT 1B (GO-32)", "KKS-1 (KISEKI)", "RADFXSAT (FOX-1B)", "FOX-1D (AO-92)",
            "Horyu-4", "UKUBE-1"
        };
        
    public static final String[] ACCEPTED_TRANSLATIONS = {
            "AO-7", "AO-16", "LO-19", "AO-10", "UO-11", "IO-26", "RS-15", "FO-29",
            "ARISS", "AO-40", "RS-30", "RS-41", "RS-43", "NO-44", "DO-64", "RS-47",
            "LO-74", "SO-50", "CO-55", "CO-57", "CO-58", "RS-22", "CO-66", "SO-67",
            "TW-1C", "TW-1B", "TW-1A", "ARSAT-1", "ARSAT-2", "FIREBIRD-3", "FIREBIRD-4",
            "IO-86", "HO-68", "RS-48", "LO-87", "AO-71", "DELF3", "AO-73", "EO-79",
            "LILAC", "TITA", "EO-79", "EO-80", "SPROU", "CO-65", "ATHEN", "GO-32",
            "KKS-1", "AO-91", "AO-92", "HORYU", "UKUBE"
    };
        
    
    public SatelliteUpdateProcessor(String basePath) {
    	this.basePath = basePath;
        this.processor = new SatelliteTLEProcessor(basePath);
        this.fileWriter = new SatelliteFileWriter(basePath);
        
        initializeSatelliteReplacements();
    }
    
    private void initializeSatelliteReplacements() {
        fileWriter.loadSatelliteReplacements(ACCEPTED_SATELLITES, ACCEPTED_TRANSLATIONS);
    }
    
    public void processAndSaveAllData() {
        try {
            System.out.println("Starting satellite data processing...");
            
            // Process all satellite data
            processor.processSatelliteData();
            
            // Get processed data
            String keplers = processor.getKepsNew();
            String alljs = processor.getAllJs();
            String nasajs = processor.getNasaJs();
            String kepsdate = processor.getKepsDate();
            
            System.out.println("Processing completed. Saving files...");
            
            // Save all files
            fileWriter.saveAllSatelliteFiles(keplers, nasajs, alljs, kepsdate);
            
            
            
            System.out.println("All files saved successfully to: " + fileWriter.getOutPath());
            
            // Optionally, save space-track URLs if you need them
            saveSpaceTrackUrls();
            
        } catch (Exception e) {
            System.err.println("Error in processing and saving: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    private void saveSpaceTrackUrls() {
        try {
        	
         	List<String> addsat = AddSatProcessor.readAddSatStreams(basePath);
            String stfinal = "/orderby/TLE_LINE1 ASC/format/3le";
            StringBuilder strack = new StringBuilder("https://www.space-track.org/basicspacedata/query/class/tle_latest/ORDINAL/1/NORAD_CAT_ID/");
            StringBuilder strack1 = new StringBuilder();
            if (!addsat.isEmpty()) {
                String satelliteIds = addsat.stream()
                        .collect(Collectors.joining(","));
                
                strack.append(satelliteIds).append(stfinal);
                strack1.append(satelliteIds).append(stfinal);

            }
  
            fileWriter.setSpaceTrackUrl(strack.toString());
            fileWriter.setSpaceTrack1Url(strack1.toString());
            
            fileWriter.saveSpaceTrackUrls();
            
            System.out.println("Space-track URL: " + fileWriter.getSpaceTrackUrl());
            
        } catch (Exception e) {
            System.err.println("Error saving space-track URLs: " + e.getMessage());
        }
    }
    
    // Method to save individual files if needed
    public void saveIndividualFiles() {
        try {
            String keplers = processor.getKepsNew();
            String alljs = processor.getAllJs();
            String nasajs = processor.getNasaJs();
            
            // Save individual files
            fileWriter.saveKeplersToFile(keplers, "custom_keps.txt");
            fileWriter.saveJavaScriptFile(alljs, "custom_all.js");
            fileWriter.saveJavaScriptFile(nasajs, "custom_nasa.js");
            
        } catch (Exception e) {
            System.err.println("Error saving individual files: " + e.getMessage());
        }
    }
    
    // Method to check and read existing files
    public void checkExistingFiles() {
        String[] filesToCheck = {"nasa.all", "nasa.txt", "keps.txt", "nasa.js", "all.js"};
        
        for (String fileName : filesToCheck) {
            if (fileWriter.fileExists(fileName)) {
                System.out.println("File exists: " + fileName);
                try {
                    String content = fileWriter.readFile(fileName);
                    System.out.println("  Size: " + content.length() + " characters");
                } catch (Exception e) {
                    System.err.println("  Error reading file: " + e.getMessage());
                }
            } else {
                System.out.println("File not found: " + fileName);
            }
        }
    }
    
    // Getters for accessing the components
    public SatelliteTLEProcessor getProcessor() {
        return processor;
    }
    
    public SatelliteFileWriter getFileWriter() {
        return fileWriter;
    }

}

