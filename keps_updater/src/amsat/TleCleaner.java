package amsat;

import java.util.*;
import java.util.regex.*;

public class TleCleaner {

	public static StringBuilder sanitize(StringBuilder sb, String prefix) {
	    List<List<String>> cleanTles = parseAndValidateTleFromString(sb.toString());
	    StringBuilder sbSanitized = new StringBuilder(prefix);  

	    for (List<String> tle : cleanTles) {
	    	sbSanitized.append("  [\n")
	    	 .append("    \"").append(tle.get(0)).append("\",\n")
	    	 .append("    \"").append(tle.get(1)).append("\",\n")
	    	 .append("    \"").append(tle.get(2)).append("\"\n")
	         .append("  ],\n");
	    }

	    sbSanitized.append("];");
	    return sbSanitized;
	}

   public static List<List<String>> parseAndValidateTleFromString(String rawJsArray) {
       List<List<String>> validTles = new ArrayList<>();

       Pattern blockPattern = Pattern.compile("\\[\\s*\"([^\"]+)\"\\s*,\\s*\"([^\"]+)\"\\s*,\\s*\"([^\"]+)\"\\s*\\]");
       Matcher matcher = blockPattern.matcher(rawJsArray);

       while (matcher.find()) {
           String name = matcher.group(1).replaceAll("\"", "").trim();
           String line1 = matcher.group(2).trim();
           String line2 = matcher.group(3).trim();

           if (isValidTlePair(line1, line2)) {
               validTles.add(Arrays.asList(name, line1, line2));
           }
       }

       return validTles;
   }

   public static boolean isValidTlePair(String line1, String line2) {
       return isValidTleLine(line1, 1) &&
              isValidTleLine(line2, 2) &&
              tleSatelliteIdMatches(line1, line2) &&
              checksumIsValid(line1) &&
              checksumIsValid(line2);
   }

   public static boolean isValidTleLine(String line, int expectedLineNumber) {
       return line.startsWith(expectedLineNumber + " ") && line.length() == 69;
   }

   public static boolean tleSatelliteIdMatches(String line1, String line2) {
       try {
           return line1.substring(2, 7).equals(line2.substring(2, 7));
       } catch (Exception e) {
           return false;
       }
   }

   public static boolean checksumIsValid(String line) {
       if (line.length() != 69) return false;
       int expected = Character.getNumericValue(line.charAt(68));
       int actual = 0;

       for (int i = 0; i < 68; i++) {
           char c = line.charAt(i);
           if (Character.isDigit(c)) {
               actual += Character.getNumericValue(c);
           } else if (c == '-') {
               actual += 1;
           }
       }

       return actual % 10 == expected;
   }
}
