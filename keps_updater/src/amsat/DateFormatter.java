package amsat;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DateFormatter {
    
    public static String getYYDDDFormatted() {
        LocalDate now = LocalDate.now();
        
        // Format directly using pattern: yy = 2-digit year, DDD = 3-digit day of year
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyDDD");
        return now.format(formatter);
    }
    
   
    public static boolean isValidYYDDD(String yyddd) {
        if (yyddd == null || yyddd.length() != 5) {
            return false;
        }
        
        try {
            int year = Integer.parseInt(yyddd.substring(0, 2));
            int dayOfYear = Integer.parseInt(yyddd.substring(2, 5));
            
            // Basic validation
            return year >= 0 && year <= 99 && dayOfYear >= 1 && dayOfYear <= 366;
        } catch (NumberFormatException e) {
            return false;
        }
    }
    
    // Convert YYDDD back to LocalDate (assumes 21st century for YY < 50, 20th century for YY >= 50)
    public static LocalDate parseYYDDD(String yyddd) {
        if (!isValidYYDDD(yyddd)) {
            throw new IllegalArgumentException("Invalid YYDDD format: " + yyddd);
        }
        
        int yy = Integer.parseInt(yyddd.substring(0, 2));
        int ddd = Integer.parseInt(yyddd.substring(2, 5));
        
        // Y2K handling: assume 00-49 means 2000-2049, 50-99 means 1950-1999
        int fullYear = (yy < 50) ? 2000 + yy : 1900 + yy;
        
        return LocalDate.ofYearDay(fullYear, ddd);
    }
    
}

