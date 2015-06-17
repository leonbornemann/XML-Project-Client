package urlhandler;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

public class QuestionDisplayer {

    /**
     * Queries the server (through a URL) for a question
     * and displays it on the screen (needs that Tomcat is running locally)
     * TODO Make this fancier
     * @throws Exception
     */
    public ArrayList<String> showQuestion() throws Exception {


     // URL questionURL = new URL("http://localhost:8080/XML-Project/quiz/hello/welcome");
        URL welcomeURL = new URL("http://localhost:8080/XML-Project/quiz/hello/question");
        
        BufferedReader br = new BufferedReader(
                new InputStreamReader(welcomeURL.openStream()));

        ArrayList<String> lines = new ArrayList<String>();
        String inputLine;
        
        while ((inputLine = br.readLine()) != null) 
            lines.add(inputLine);
        
        
        br.close();
        
        return lines;
        
        
        
        // Testing connection
        // URLConnection questionConn = welcomeURL.openConnection();
        // questionConn.connect();
        
        
    }
    
    /**
     * Main for testing 
     * @param args
     */
    public static void main(String[] args) {
        
        QuestionDisplayer qd = new QuestionDisplayer();
        try {
            ArrayList<String> lines = qd.showQuestion();
            for (String s : lines)
                System.out.println(s);
        
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
