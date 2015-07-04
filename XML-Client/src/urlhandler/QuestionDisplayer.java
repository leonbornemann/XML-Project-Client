package urlhandler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;

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
				this.question = questionList.getQuestion(questionCounter);
				XMLQuestion questions=question;
				request.setAttribute("question", questions);
				request.setAttribute("questionCounter", questionCounter+1);
				request.setAttribute("numQuestion", numQuestions);
				//create a randomized list of answers
				ArrayList<String> answerList = createRandomAnswerList(questions);
				request.setAttribute("answerList", answerList);
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
			this.question = questionList.getQuestion(questionCounter);
			
			XMLQuestion questions=question;
			request.setAttribute("question", questions);
			request.setAttribute("questionCounter", questionCounter+1);
			request.setAttribute("numQuestion", numQuestions);
			//create a randomized list of answers
			ArrayList<String> answerList = createRandomAnswerList(questions);
			request.setAttribute("answerList", answerList);
			RequestDispatcher view = request.getRequestDispatcher("/quiz.jsp");
			view.forward(request, response);
		}
		else if ("summary".equals(status)){
			String givenAnswer = request.getParameter("summary");
			if ("1".equals(givenAnswer)){
				this.correctAnswerCounter++;
			}
			request.setAttribute("correctAnswerCounter", correctAnswerCounter);
			request.setAttribute("questionCounter", questionCounter+1);
			request.setAttribute("numQuestion", numQuestions);
			RequestDispatcher view = request.getRequestDispatcher("/summary.jsp");
			view.forward(request, response);
		}
	}
	
	
	private ArrayList<String> createRandomAnswerList(XMLQuestion questions){
		ArrayList<String> answerList = new ArrayList<String>();
		answerList.add(questions.getQuestionAnswers().getRight());
		answerList.add(questions.getQuestionAnswers().getWrong1());
		answerList.add(questions.getQuestionAnswers().getWrong2());
		answerList.add(questions.getQuestionAnswers().getWrong3());
		Collections.shuffle(answerList);
		return answerList;
	}

	/**
	 * Queries the server (through a URL) for a question and displays it on the
	 * screen (needs that Tomcat is running locally) TODO Make this fancier
	 * 
	 * @throws Exception
	 */
	public String showQuestion(int numberOfQuestions) throws Exception {

		StringBuilder sb = new StringBuilder();
		URL welcomeURL = new URL(
				"http://localhost:8080/XML-Project/quiz/hello/question"+numberOfQuestions);
		BufferedReader br = new BufferedReader(new InputStreamReader(
				welcomeURL.openStream(), "UTF-8"));
		String inputLine;
		while ((inputLine = br.readLine()) != null)
			sb.append(inputLine);

		br.close();
		return sb.toString();
	}



}
