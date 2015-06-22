package urlhandler;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class QuestionDisplayer {
	
	private String sentence;
	private String translation;
	private List<String> answers;

    /**
     * Queries the server (through a URL) for a question
     * and displays it on the screen (needs that Tomcat is running locally)
     * TODO Make this fancier
     * @throws Exception
     */
    public ArrayList<String> showQuestion(int numerOfQuestions) throws Exception {


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
    
    public String getSentence() {
		return "Peter wusch die Füße seines Sohns.";
	}

	public void setSentence(String sentence) {
		this.sentence = sentence;
	}

	public String getTranslation() {
		return "Paul washed his son’s feet.";
	}

	public void setTranslation(String translation) {
		this.translation = translation;
	}

	public List<String> getAnswers() {
		List<String> answers = new ArrayList<String>();
		answers.add("German");
		answers.add("English");
		answers.add("Finnish");
		answers.add("Polish");
		return answers;
	}

	public void setAnswers(List<String> answers) {
		this.answers = answers;
	}

	/**
     * Main for testing 
     * @param args
     */
    //TODO: change the call "qd.showQuestion();"; code really necessary?
    public static void main(String[] args) {
        /*
        QuestionDisplayer qd = new QuestionDisplayer();
        try {
            ArrayList<String> lines = qd.showQuestion();
            for (String s : lines)
                System.out.println(s);
        
        } catch (Exception e) {
            e.printStackTrace();
        }*/
    }
    
    

}
