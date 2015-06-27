var correctAnswer;
var correctGivenAnswers;
var gameMode;
var currentSentenceCounter;

// disable all answer buttons
function disableButtons(){
	for (var i=1;i<=4;i++){
		$("#answerButton"+i).attr('disabled', 'disabled');
	}
}

$(document).ready(function() {
	// 
	$(":button").click(function(event) {
		if ($(this).prop("id") == "answerButton1") {
			$("#nextSentenceButton").attr('class', 'myButtonNext');
			$("#answerButton1").attr('class', 'myButtonWrong');
			$("#answerButton"+correctAnswer).attr('class', 'myButtonRight');
			disableButtons();
			if (correctAnswer==1) correctGivenAnswers++;
			$("#nextSentenceForm").get(0).setAttribute('action', 'quiz.jsp?m='+currentSentenceCounter+'&n='+correctGivenAnswers);
		} else if ($(this).prop("id") == "answerButton2") {
			$("#nextSentenceButton").attr('class', 'myButtonNext');
			$("#answerButton2").attr('class', 'myButtonWrong');
			$("#answerButton"+correctAnswer).attr('class', 'myButtonRight');
			disableButtons();
			if (correctAnswer==2) correctGivenAnswers++;
			$("#nextSentenceForm").get(0).setAttribute('action', 'quiz.jsp?m='+currentSentenceCounter+'&n='+correctGivenAnswers);
		} else if ($(this).prop("id") == "answerButton3") {
			$("#nextSentenceButton").attr('class', 'myButtonNext');
			$("#answerButton3").attr('class', 'myButtonWrong');
			$("#answerButton"+correctAnswer).attr('class', 'myButtonRight');
			disableButtons();
			if (correctAnswer==3) correctGivenAnswers++;
			$("#nextSentenceForm").get(0).setAttribute('action', 'quiz.jsp?m='+currentSentenceCounter+'&n='+correctGivenAnswers);
		} else if ($(this).prop("id") == "answerButton4") {
			$("#nextSentenceButton").attr('class', 'myButtonNext');
			$("#answerButton4").attr('class', 'myButtonWrong');
			$("#answerButton"+correctAnswer).attr('class', 'myButtonRight');
			disableButtons();
			if (correctAnswer==4) correctGivenAnswers++;
			$("#nextSentenceForm").get(0).setAttribute('action', 'quiz.jsp?m='+currentSentenceCounter+'&n='+correctGivenAnswers);
		}
		
		// enable summary button if it is the last sentence
		if (gameMode==(currentSentenceCounter) & gameMode!=undefined){
			$("#nextSentenceButton").attr('class', 'myButtonInvisible');
			$("#summaryButton").attr('class', 'myButtonNext');
			$("#summaryForm").get(0).setAttribute('action', 'summary.jsp?m='+correctGivenAnswers);
		}
	});
});
