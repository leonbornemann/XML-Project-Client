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
	
	//this piece of codes convers object to svg such that we can apply CSS to it.
	// without this nothing is applied!
	jQuery('object.svg').each(function(){
        var $img = jQuery(this);
        var imgID = $img.attr('id');
        var imgClass = $img.attr('class');
        var imgURL = $img.attr('src');

        jQuery.get(imgURL, function(data) {
            // Get the SVG tag, ignore the rest
            var $svg = jQuery(data).find('svg');

            // Add replaced image's ID to the new SVG
            if(typeof imgID !== 'undefined') {
                $svg = $svg.attr('id', imgID);
            }
            // Add replaced image's classes to the new SVG
            if(typeof imgClass !== 'undefined') {
                $svg = $svg.attr('class', imgClass+' replaced-svg');
            }

            // Remove any invalid XML tags as per http://validator.w3.org
            $svg = $svg.removeAttr('xmlns:a');

            // Replace image with new SVG
            $img.replaceWith($svg);

        }, 'xml');
    });
	
		
	// button event handler
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
		$.get('Servlet', function(data) {
	        alert(data);
	    });
		// enable summary button if it is the last sentence
		if (gameMode==(currentSentenceCounter) & gameMode!=undefined){
			$("#nextSentenceButton").attr('class', 'myButtonInvisible');
			$("#summaryButton").attr('class', 'myButtonNext');
			$("#summaryForm").get(0).setAttribute('action', 'summary.jsp?m='+correctGivenAnswers);
		}
	});
	
	// when the svg DOM is loaded, we can change colors
	$(window).load(function(){
		// get the object and withing the svg search for DE
	    	var a = document.getElementById("svgObject");
	    	var svgDoc = a.contentDocument;
	    	var path = svgDoc.getElementById("DE");
	    	path.setAttribute("style","fill:red");
	    	
	    	path = svgDoc.getElementById("PL");
	    	path.setAttribute("style","fill:red");
	    
	});

});
