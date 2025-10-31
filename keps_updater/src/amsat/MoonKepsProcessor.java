package amsat;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class MoonKepsProcessor {
    
    public static String processMoonKepsWithLists(String basePath, String YYDDD) throws IOException {
        String thePath = basePath;
        String theFile = thePath + "moonkeps.txt";
        Path filePath = Paths.get(theFile);
        
        List<String> lines = Files.readAllLines(filePath);
        
        String moonline1save = "";
        String moonline2save = "";
        String moonline3save = "";
        
        // Process lines in groups of 3
        for (int i = 0; i < lines.size() - 2; i += 3) {
            // Save previous set (equivalent to moonline1save = moonline1 & vbCrLf)
            if (i > 0) {
                moonline1save = lines.get(i - 3) + "\r\n";
                moonline2save = lines.get(i - 2) + "\r\n";
                moonline3save = lines.get(i - 1) + "\r\n";
            }
            
            String moonline1 = lines.get(i);
            String moonline2 = lines.get(i + 1);
            String moonline3 = lines.get(i + 2);
            
            // Check condition: if mid(moonline2,19,5) > YYDDD then exit
            if (moonline2.length() >= 24) {
                String dateStr = moonline2.substring(18, 23);
                if (dateStr.compareTo(YYDDD) > 0) {
                    break;
                }
            }
            
            // Update saved lines for next iteration
            moonline1save = moonline1 + "\r\n";
            moonline2save = moonline2 + "\r\n";
            moonline3save = moonline3 + "\r\n";
        }
        
        // Build the final result
        String sunkeps1 = "SUN95 SUN PSEUDO KEPS" + "\r\n";
        String sunkeps2 = "1 00001U 00000    95080.09236111  .00000000  00000-0  10000-3 0 99999" + "\r\n";
        String sunkeps3 = "2 00001 023.3400 000.0000 0000001 282.8700 075.2803 00.00273791000018" + "\r\n";
        
        return moonline1save + moonline2save + moonline3save + sunkeps1 + sunkeps2 + sunkeps3;
    }
  
}

