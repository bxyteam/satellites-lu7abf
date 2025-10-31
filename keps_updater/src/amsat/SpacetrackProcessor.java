package amsat;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

public class SpacetrackProcessor {
    
	public static Map<Integer, String[]> processSpacetrackMap(String basePath) throws IOException {
	    Map<Integer, String[]> stkeps = new HashMap<>();
	    
	    Stream<String> lines = readSpaceTrackFile(basePath); 
	    lines.filter(linea -> linea.length() > 50)
	        .forEach(linea -> {
	            try {
	                // Extract satellite number from positions 2-6, handling both leading zeros and spaces
	                String satNumStr = linea.substring(2, 7).trim();
	                int rowIndex = Integer.parseInt(satNumStr);
	                
	                int colIndex = Integer.parseInt(linea.substring(0, 1).trim()) - 1; // left(linea,1) - 1
	                
	                if (colIndex == 0 || colIndex == 1) {
	                    // Fix the line format by padding satellite number with leading zeros if needed
	                    final String fixedLine;
	                    if (satNumStr.length() < 5) {
	                        String paddedSatNum = String.format("%05d", rowIndex);
	                        fixedLine = linea.charAt(0) + " " + paddedSatNum + linea.substring(7);
	                    } else {
	                        fixedLine = linea;
	                    }
	                    
	                    stkeps.compute(rowIndex, (key, val) -> {
	                        if (val == null) val = new String[2];
	                        val[colIndex] = fixedLine;
	                        return val;
	                    });
	                }
	                
	            } catch (NumberFormatException | StringIndexOutOfBoundsException e) {
	                System.err.println("Skipping invalid line: " + linea);
	            }
	        });
	    
	    return stkeps;
	}

	public static List<String> processSpacetrackLines(String basePath) throws IOException {
	    List<String> spaceTrack = new ArrayList<>();

	    Stream<String> lines = readSpaceTrackFile(basePath);
	    lines.forEach(linea -> {
	        try {
	            final String fixedLine;
	            
	            // Check if this is a TLE line (line 1 or 2) that needs fixing
	            if (linea.length() > 7 && (linea.charAt(0) == '1' || linea.charAt(0) == '2')) {
	                String satNumStr = linea.substring(2, 7).trim();
	                
	                // If satellite number is less than 5 digits, pad with leading zeros
	                if (satNumStr.length() < 5 && satNumStr.matches("\\d+")) {
	                    int satNum = Integer.parseInt(satNumStr);
	                    String paddedSatNum = String.format("%05d", satNum);
	                    fixedLine = linea.charAt(0) + " " + paddedSatNum + linea.substring(7);
	                } else {
	                    fixedLine = linea;
	                }
	            } else {
	                // Line 0 (satellite name) or other lines - no modification needed
	                fixedLine = linea;
	            }
	            
	            spaceTrack.add(fixedLine);
	            
	        } catch (NumberFormatException | StringIndexOutOfBoundsException e) {
	            System.err.println("Skipping invalid line: " + linea);
	        }
	    });

	    return spaceTrack;
	}
	
    public static Stream<String> readSpaceTrackFile(String basePath) throws IOException {
        String thePath = basePath;
        String theFile = thePath + "spacetrack2.txt";
        Path filePath = Paths.get(theFile);
        
        return Files.lines(filePath);
    }

}

