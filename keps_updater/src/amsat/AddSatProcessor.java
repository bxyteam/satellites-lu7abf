package amsat;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class AddSatProcessor {

    public static List<String> readAddSatStreams(String basePath) throws IOException {
        String thePath = basePath;
        String theFile = thePath + "addsat.txt";
        Path filePath = Paths.get(theFile);
        return Files.readAllLines(filePath);
    }
    
}

