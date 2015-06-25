$(document).ready(function() {
	$(":button").click(function(event) {
		var e = 0;
		if ($(this).prop("id") == "answerButton1") {

			alert($(this).prop("value"));
		} else if ($(this).prop("name") == "modeButton") {
			alert($(this).prop("value"));
		} else {
			alert($(this).prop("name"));
		}

	});

});
