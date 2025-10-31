package amsat;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.net.ssl.HttpsURLConnection;

public class SpaceTrackReader {

	private Pattern SPECIAL_REGEX_CHARS = Pattern.compile("[{}()\\[\\].+*?^$\\\\|]");
	private List<String> cookies = new ArrayList<String>();
	private HttpsURLConnection conn;
	private final String USER_AGENT = "Mozilla/5.0";
    private final static String SPACE_TRACK_INPUT_FILE = System.getenv("SATELLITE_KEPS_DIR") + "/spacetrack1.txt";
    private final static String SPACE_TRACK_OUTPUT_FILE = System.getenv("SATELLITE_KEPS_DIR") + "/spacetrack2.txt";
    
	public static void run() {

		SpaceTrackReader http = new SpaceTrackReader();

		try {
			// read file to a variable
			String input = http.readFileToString(SPACE_TRACK_INPUT_FILE);
			input = input.replace(" ", "%20");

			// make sure cookies is turn on
			CookieHandler.setDefault(new CookieManager());

			// send request to get csfr_token needed to login
			String loginPage = http.GetPageContent("https://www.space-track.org/auth/login");
			String csfrToken = http.getStringBetweenTags(loginPage, "options.data += \"spacetrack_csrf_token=", "\";");

			// send a post request to login to the site
			String identity = System.getenv("SPACE_TRACK_IDENTITY");
			String password = System.getenv("SPACE_TRACK_PASSWORD");
			http.sendPost("https://www.space-track.org/auth/login", "identity=" + identity 
					+ "&password=" + password + "&spacetrack_csrf_token=" + csfrToken);

			// get page to obtain desired information
			String result = http.GetPageContent(
					"https://www.space-track.org/basicspacedata/query/class/tle_latest/ORDINAL/1/NORAD_CAT_ID/"
							+ input);

			// save results to file
			http.saveStringToFile(SPACE_TRACK_OUTPUT_FILE, result);
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("Error space track reader: " + e.getMessage());
		    System.exit(1);
		}
	}

	private String readFileToString(String file) throws Exception {
		InputStream is = new FileInputStream(file);
		try (BufferedReader buf = new BufferedReader(new InputStreamReader(is))) {
			String line = buf.readLine();
			StringBuilder sb = new StringBuilder();
			while (line != null) {
				sb.append(line).append("\r\n");
				line = buf.readLine();
			}
			return sb.toString();
		}
	}

	private void saveStringToFile(String fileName, String contents) {
		BufferedWriter bw = null;
		FileWriter fw = null;
		try {
			fw = new FileWriter(fileName);
			bw = new BufferedWriter(fw);
			bw.write(contents);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bw != null)
					bw.close();
				if (fw != null)
					fw.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	}

	private void sendPost(String url, String postParams) throws Exception {
		URL obj = new URL(url);
		conn = (HttpsURLConnection) obj.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("User-Agent", USER_AGENT);
		for (String cookie : this.cookies) {
			conn.addRequestProperty("Cookie", cookie.split(";", 1)[0]);
		}
		conn.setRequestProperty("Connection", "keep-alive");
		conn.setRequestProperty("Referer", "https://accounts.google.com/ServiceLoginAuth");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", Integer.toString(postParams.length()));
		conn.setDoOutput(true);
		conn.setDoInput(true);
		DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
		wr.writeBytes(postParams);
		wr.flush();
		wr.close();
		int responseCode = conn.getResponseCode();
		System.out.println("\nSending 'POST' request to URL : " + url);
		System.out.println("Post parameters : " + postParams);
		System.out.println("Response Code : " + responseCode);
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
	}

	private String GetPageContent(String url) throws Exception {
		URL obj = new URL(url);
		conn = (HttpsURLConnection) obj.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("User-Agent", USER_AGENT);
		if (cookies != null) {
			for (String cookie : this.cookies) {
				conn.addRequestProperty("Cookie", cookie.split(";", 1)[0]);
			}
		}
		int responseCode = conn.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine + "\n");
		}
		in.close();
		setCookies(conn.getHeaderFields().get("Set-Cookie"));
		return response.toString();
	}

	public List<String> getCookies() {
		return cookies;
	}

	public void setCookies(List<String> cookies) {
		this.cookies = cookies;
	}

	private String getStringBetweenTags(String source, String startTag, String endTag) {
		Pattern pattern = Pattern
				.compile(escapeSpecialRegexChars(startTag) + "(.+?)" + escapeSpecialRegexChars(endTag));
		Matcher matcher = pattern.matcher(source);
		matcher.find();
		return matcher.group(1);
	}

	private String escapeSpecialRegexChars(String str) {
		return SPECIAL_REGEX_CHARS.matcher(str).replaceAll("\\\\$0");
	}

}
