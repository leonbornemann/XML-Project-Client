package urlhandler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xmlquestion.XMLQuestion;
import xmlquestion.XMLQuestionList;
import xmlquestion.XMLUtilities;

public class QuestionDisplayer extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	private int numQuestions;
	private XMLQuestion question;
	private XMLQuestionList questionList;
	private int questionCounter;

	private String sentence;
	private String translation;
	private List<String> answers;
	private String correctAnswerString;
	private int currentSentenceCounter = 0;
	private int gameMode = 0;

	// only for testing
	private List<String> sentences;
	private List<String> translations;
	private List<Integer> correctAnswer;
	private List<List<String>> answersList;
	private List<String> spokenInList;
	
	private int correctAnswerCounter;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * Aufruf von index.html: hole Fragen und lade die erste in die Seite.
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String status = request.getParameter("status");
		if ("index".equals(status)) {

			numQuestions = Integer.parseInt(request.getParameter("numberOfQuestions"));
			try {
				String showQuestion = showQuestion(numQuestions);
				this.questionList = XMLUtilities.convertFromXML(showQuestion);
				this.questionCounter = 0;
				this.correctAnswerCounter = 0;
				setQuestion(questionList.getQuestion(questionCounter));
				request.setAttribute("question", getQuestion());
				request.setAttribute("questionCounter", questionCounter+1);
				request.setAttribute("numQuestion", numQuestions);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}

			RequestDispatcher view = request.getRequestDispatcher("/quiz.jsp");
			view.forward(request, response);
		}
		
		else if ("quiz".equals(status)){
			String givenAnswer = request.getParameter("givenAnswer");
			if ("1".equals(givenAnswer)){
				this.correctAnswerCounter++;
			}
			this.questionCounter++;
			setQuestion(questionList.getQuestion(questionCounter));
			request.setAttribute("question", getQuestion());
			request.setAttribute("questionCounter", questionCounter+1);
			request.setAttribute("numQuestion", numQuestions);
			
			
			RequestDispatcher view = request.getRequestDispatcher("/quiz.jsp");
			view.forward(request, response);
		}
		else if ("summary".equals(status)){
			request.setAttribute("correctAnswerCounter", correctAnswerCounter);
			request.setAttribute("questionCounter", questionCounter+1);
			request.setAttribute("numQuestion", numQuestions);
			RequestDispatcher view = request.getRequestDispatcher("/summary.jsp");
			view.forward(request, response);
		}
	}
	

	/**
	 * Queries the server (through a URL) for a question and displays it on the
	 * screen (needs that Tomcat is running locally) TODO Make this fancier
	 * 
	 * @throws Exception
	 */
	public String showQuestion(int numberOfQuestions) throws Exception {

		StringBuilder sb = new StringBuilder();
		// URL questionURL = new
		// URL("http://localhost:8080/XML-Project/quiz/hello/welcome");
		URL welcomeURL = new URL(
				"http://localhost:8080/XML-Project/quiz/hello/question"+numberOfQuestions);

		BufferedReader br = new BufferedReader(new InputStreamReader(
				welcomeURL.openStream(), "UTF-8"));

		String inputLine;

		while ((inputLine = br.readLine()) != null)
			sb.append(inputLine);

		br.close();

		return sb.toString();

		// Testing connection
		// URLConnection questionConn = welcomeURL.openConnection();
		// questionConn.connect();

	}

	/********************
	 * GETTER UND SETTER
	 ********************/

	public List<String> getSpokenInList() {
		return spokenInList;
	}

	public void setSpokenInList(List<String> spokenInList) {
		this.spokenInList = spokenInList;
	}

	// public String getCurrentSentenceCounter() {
	// return "" + (currentSentenceCounter + 1);
	// }
	//
	// public void setCurrentSentenceCounter(String counter) {
	// this.currentSentenceCounter = Integer.parseInt(counter);
	// }

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
		return answersList.get(currentSentenceCounter).get(
				correctAnswer.get(currentSentenceCounter));
	}

	public void setCorrectAnswerString(String correctAnswerString) {
		this.correctAnswerString = correctAnswerString;
	}

	public XMLQuestion getQuestion() {
		return question;
	}

	public int getQuestionCounter() {
		return questionCounter;
	}

	public void setQuestionCounter(int questionCounter) {
		this.questionCounter = questionCounter;
	}

	public void setQuestion(XMLQuestion question) {
		this.question = question;
	}

	public XMLQuestionList getQuestionList() {
		return questionList;
	}

	public void setQuestionList(XMLQuestionList questionList) {
		this.questionList = questionList;
	}

	/******************
	 * TEST
	 * 
	 * @throws Exception
	 ******************/
	public static void main(String[] args) throws Exception {
		// QuestionDisplayer q = new QuestionDisplayer();
		// ArrayList<String> obj = q.showQuestion(2);
		// for (String string : obj) {
		// System.out.println(string);
		// }
	}

	public void test() {
		// Test
		sentences = new ArrayList<String>();
		sentences.add("Tai ’ deing o min a.");
		sentences.add("Il pleut.");

		translations = new ArrayList<String>();
		translations.add("We are all here.");
		translations.add("It is raining.");

		answersList = new ArrayList<List<String>>();
		answers = new ArrayList<String>();
		answers.add("Wersing");
		answers.add("Teiwa");
		answers.add("Abui");
		answers.add("Kamang");
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
		spokenInList.add("Indonesia");
		spokenInList.add("Malaysia");

		// Test Ende
	}
}
