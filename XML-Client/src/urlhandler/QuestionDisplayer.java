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
	
	String correctAnswerString;
	
	private int currentSentenceCounter = 0;
	private int gameMode = 0;
	
	// only for testing
	private List<String> sentences;
	private List<String> translations;
	private List<Integer> correctAnswer;
	private List<List<String>> answersList;
	private List<String> spokenInList;

	public List<String> getSpokenInList() {
		return spokenInList;
	}

	public void setSpokenInList(List<String> spokenInList) {
		this.spokenInList = spokenInList;
	}

	public void test() {
		// Test
		sentences = new ArrayList<String>();
		sentences.add("Peter wusch die Füße seines Sohns.");
		sentences.add("Il pleut.");

		translations = new ArrayList<String>();
		translations.add("Peter washed his son's feet.");
		translations.add("It is raining.");

		answersList = new ArrayList<List<String>>();
		answers = new ArrayList<String>();
		answers.add("German");
		answers.add("English");
		answers.add("Finnish");
		answers.add("Polish");
		answersList.add(answers);
		
		answers = new ArrayList<String>();
		answers.add("English");
		answers.add("Czech");
		answers.add("French");
		answers.add("Swedish");
		answersList.add(answers);

		correctAnswer = new ArrayList<Integer>();
		correctAnswer.add(1);
		correctAnswer.add(3);
		
		spokenInList = new ArrayList<String>();
		spokenInList.add("Germany");
		spokenInList.add("Poland");

		// Test Ende
	}

	/**
	 * Queries the server (through a URL) for a question and displays it on the
	 * screen (needs that Tomcat is running locally) TODO Make this fancier
	 * 
	 * @throws Exception
	 */
	public ArrayList<String> showQuestion(int numberOfQuestions)
			throws Exception {

		// URL questionURL = new
		// URL("http://localhost:8080/XML-Project/quiz/hello/welcome");
		URL welcomeURL = new URL(
				"http://localhost:8080/XML-Project/quiz/hello/question");

		BufferedReader br = new BufferedReader(new InputStreamReader(
				welcomeURL.openStream()));

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

	public String getCurrentSentenceCounter() {
		return "" + (currentSentenceCounter + 1);
	}

	public void setCurrentSentenceCounter(String counter) {
		this.currentSentenceCounter = Integer.parseInt(counter);
	}

	public String getGameMode() {
		return "" + (gameMode);
	}

	public void setGameMode(String counter) {
		this.gameMode = Integer.parseInt(counter);
	}
	
	public Integer getCorrectAnswer() {
		return correctAnswer.get(currentSentenceCounter);
	}

	public String getSentence() {
		return sentences.get(currentSentenceCounter);
	}

	public void setSentence(String sentence) {
		this.sentence = sentence;
	}

	public String getTranslation() {
		return translations.get(currentSentenceCounter);
	}

	public void setTranslation(String translation) {
		this.translation = translation;
	}

	public List<String> getAnswers() {
		return answersList.get(currentSentenceCounter);
	}

	public void setAnswers(List<String> answers) {
		this.answers = answers;
	}

	public String getCorrectAnswerString() {
		return answersList.get(currentSentenceCounter).get(correctAnswer.get(currentSentenceCounter));
	}

	public void setCorrectAnswerString(String correctAnswerString) {
		this.correctAnswerString = correctAnswerString;
	}
	

	/**
	 * Main for testing
	 * 
	 * @param args
	 */
	public static void main(String[] args) {

	}
}
