var countries;
var correctAnswer;
var questionCounter;
var numQuestion;
var answerList;


// disable all answer buttons
function disableButtons(){
	for (var i=1;i<=4;i++){
		$("#answerButton"+i).attr('disabled', 'disabled');
	}
}

$(document).ready(function() {
	// change font size if texts are too long
	var originalSentence = $("#originalSentence").text();
	if (originalSentence.length > 60)
		$("#originalSentence").attr('style', 'font-size: 17px !important;');	
	
	var translationSentence = $("#translationSentence").text();
	if (translationSentence.length > 100)
		$("#translationSentence").attr('style', 'font-size: 15px !important;');
	else if (translationSentence.length > 80)
		$("#translationSentence").attr('style', 'font-size: 16px !important;');	
	else if (translationSentence.length > 60)
		$("#translationSentence").attr('style', 'font-size: 17px !important;');	
	
	// fill answer buttons randomized
	for (var i=1;i<=4;i++){
	    		var answer = answerList[i-1];
	    		$("#answerButton"+i).attr('value', answer);
	    		$("#answerButton"+i).html(answer);
	    		if (answer.length > 37)
	    			$("#answerButton"+i).attr('style', 'font-size: 10px !important;');
	    		else if (answer.length > 30)
	    			$("#answerButton"+i).attr('style', 'font-size: 12px !important;');
	    		else if (answer.length > 15)
	    			$("#answerButton"+i).attr('style', 'font-size: 14px !important;');

	    	
	}
	
	// this piece of codes convers object to svg such that we can apply CSS to
	// it.
	// without this nothing is applied!
	jQuery('object.svg').each(function(){
        var $img = jQuery(this);
        var imgID = $img.attr('id');
        var imgClass = $img.attr('class');
        var imgURL = $img.attr('data');

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
	
	
	$('*[id^=answerButton]').click(function(){
		var answer = $(this).val();
		if (answer == correctAnswer){
			$(this).attr('class','myButtonRight');
			$("#nextSentenceButton").attr('class', 'myButtonNext').attr('value', '1');
		}
		else {
			$(this).attr('class','myButtonWrong');
			console.log('TEST: '+$('button[value='+correctAnswer+']'));
			$('button[value='+correctAnswer+']').attr('class', 'myButtonRight');
			$('#nextSentenceButton').attr('class', 'myButtonNext').attr('value', '0');
		}
		
		if (numQuestion == questionCounter){
			if (answer == correctAnswer)
				$('#summaryButton').attr('class', 'myButtonNext').attr('value', '1');
			else 
				$('#summaryButton').attr('class', 'myButtonNext').attr('value', '0');
			$('#nextSentenceButton').attr('class', 'myButtonInvisible');
		}
		disableButtons();
	});
	
	$('#tippImg').click(function(){
		loadTipp();
		$('#tippImgTD').attr('class','hideTippImg');
		$('td[class~="hideTipp"]').removeClass("hideTipp");
	});
	

	// when the svg DOM is loaded, we can change colors
//	$(window).load(function(){
		// get the object and withing the svg search for DE
	function loadTipp(){
	    	var a = document.getElementById("svgObject");
	    	a.setAttribute("class", "svgObject");
// var svgDoc = a.contentDocument;
	    	
	    	for (var i=0; i<countries.length; i++){
	    		var path = a.getElementById(countries[i]);
	    		if (path != null){
	    			path.setAttribute("style","fill:red");
	    		}
	    	}
	}
	    	
//	});
	
	
});
