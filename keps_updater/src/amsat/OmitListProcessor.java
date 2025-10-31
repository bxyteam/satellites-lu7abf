package amsat;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

public class OmitListProcessor {
	  
    public static List<String> readOmitListStreams(String thePath) throws IOException {
        String theFile = thePath + "omitlist.txt";
        Path filePath = Paths.get(theFile);
        
        List<String> omitList = Files.lines(filePath)
                .map(String::trim)
                .filter(line -> !line.isEmpty())
                .collect(Collectors.toList());
        
        return omitList;
    }

}
