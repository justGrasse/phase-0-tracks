// ADDING jQUERY USING GOOGLE CONTENT DELIVERY NETWORK (CDN)
// <head>
// <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
// </head>


// INCLUDE A DOCUMENT READY EVENT (2 SYNTAX OPTIONS BELOW)
// $(function(){
$(document).ready(function(){

	// TEST THE ELEMENT SELECTOR $("em") and EVENT METHOD .click
	// ---> Click the EMPHASIS to make the aside disappear
	$("em").click(function(){
		$("aside").hide();
	});

	// Similarly you could use the id selector: $("#id") 
	// ...or the class selector: $(".class")
	// More examples of selectors: http://www.w3schools.com/jquery/jquery_selectors.asp
	// More examples of events: http://www.w3schools.com/jquery/jquery_events.asp






// CLOSE THE DOCUMENT READY EVENT
});