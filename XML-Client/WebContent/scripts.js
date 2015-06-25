var correctAnswer;
var correctGivenAnswers=0;
var gameMode;
var currentSentenceCounter;
// This function marks the answers as correct or incorrect


$(document).ready(function() {
	$(":button").click(function(event) {
		if ($(this).prop("id") == "answerButton1") {
			$("#nextSentenceButton").attr('class', 'myButtonNext');
			$("#answerButton1").attr('class', 'myButtonWrong');
			$("#answerButton"+correctAnswer).attr('class', 'myButtonRight');
			if (correctAnswer==1) correctGivenAnswers++;
		} else if ($(this).prop("id") == "answerButton2") {
			$("#nextSentenceButton").attr('class', 'myButtonNext');
			$("#answerButton2").attr('class', 'myButtonWrong');
			$("#answerButton"+correctAnswer).attr('class', 'myButtonRight');
			if (correctAnswer==2) correctGivenAnswers++;
		} else if ($(this).prop("id") == "answerButton3") {
			$("#nextSentenceButton").attr('class', 'myButtonNext');
			$("#answerButton3").attr('class', 'myButtonWrong');
			$("#answerButton"+correctAnswer).attr('class', 'myButtonRight');
			if (correctAnswer==3) correctGivenAnswers++;
		} else if ($(this).prop("id") == "answerButton4") {
			$("#nextSentenceButton").attr('class', 'myButtonNext');
			$("#answerButton4").attr('class', 'myButtonWrong');
			$("#answerButton"+correctAnswer).attr('class', 'myButtonRight');
			if (correctAnswer==4) correctGivenAnswers++;
		}
		if (gameMode==(currentSentenceCounter) & gameMode!=undefined){
			$("#nextSentenceButton").attr('class', 'myButtonInvisible');
			$("#summaryButton").attr('class', 'myButtonNext');
		}
	});
});
