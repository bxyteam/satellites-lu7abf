package amsat;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Collectors;

public class LocalKepsProcessor {
  
    public static String processLocalKepsStreams(String basePath) throws IOException, InterruptedException {
        String thePath = basePath;
        String theFile = thePath + "localkeps.txt";
        Path filePath = Paths.get(theFile);
        
        String result = Files.lines(filePath)
                .map(String::trim)
                .map(nuevalinea -> {
                    // Check if line starts with "1 " or "2 "
                    if ((nuevalinea.startsWith("1 ") || nuevalinea.startsWith("2 ")) && 
                        nuevalinea.length() >= 8) {
                        String satNumber = nuevalinea.substring(2, 7);
                        return fixCrc(satNumber, nuevalinea);
                    }
                    return nuevalinea;
                }).collect(Collectors.joining("\r\n", "", "\r\n"));
            
        return result.toUpperCase();
    }
    
    private static String fixCrc(String newNumber, String line) {
        // if newnumber="" then newnumber=mid(line,3,5)
        if (newNumber == null || newNumber.trim().isEmpty()) {
            if (line.length() >= 8) {
                newNumber = line.substring(2, 7); // mid(line,3,5) - ASP is 1-based, Java is 0-based
            } else {
                newNumber = ""; // Handle short lines
            }
        }
        
        // Ensure newNumber is exactly 5 characters, pad with spaces if needed
        if (newNumber.length() < 5) {
            newNumber = String.format("%-5s", newNumber); // Left-align and pad to 5 chars
        } else if (newNumber.length() > 5) {
            newNumber = newNumber.substring(0, 5); // Truncate to 5 chars
        }
        
        // line = left(line,2) & newnumber & right(line,len(line)-7)
        String leftPart = "";
        String rightPart = "";
        
        if (line.length() >= 2) {
            leftPart = line.substring(0, 2); // left(line,2)
        }
        
        if (line.length() > 7) {
            rightPart = line.substring(7); // right(line,len(line)-7)
        }
        
        line = leftPart + newNumber + rightPart;
        
        // line = left(line,len(line)-1) - Remove last character (old checksum)
        if (line.length() > 0) {
            line = line.substring(0, line.length() - 1);
        }
        
        // Calculate checksum
        int checksum = 0;
        
        // for h=1 to len(line)
        for (int h = 0; h < line.length(); h++) { // Java uses 0-based indexing
            char ch = line.charAt(h);
            
            // if mid(line,h,1) >= "0" and mid(line,h,1) <= "9" then checksum = checksum + mid(line,h,1)*1
            if (ch >= '0' && ch <= '9') {
                checksum += Character.getNumericValue(ch);
            }
            // if mid(line,h,1) = "-" then checksum = checksum + 1
            else if (ch == '-') {
                checksum += 1;
            }
        }
        
        // crc = right(checksum,1) - Get last digit of checksum
        int crc = checksum % 10; // Equivalent to right(checksum,1)
        
        // fixcrc = line + crc
        return line + crc;
    }
    
}

