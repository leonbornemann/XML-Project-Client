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
	
	// fill answer buttons randomized
	for (var i=1;i<=4;i++){
	    		$("#answerButton"+i).attr('value', answerList[i-1]);
	    		$("#answerButton"+i).html(answerList[i-1]);
	    	
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
	

	// when the svg DOM is loaded, we can change colors
	$(window).load(function(){
		// get the object and withing the svg search for DE
	    	var a = document.getElementById("svgObject");
// var svgDoc = a.contentDocument;
	    	
	    	for (var i=0; i<countries.length; i++){
	    		var path = a.getElementById(countries[i]);
	    		path.setAttribute("style","fill:red");
	    	}
	    	
	});

});
