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
		$("aside").toggle(500);
	});

	// Similarly you could use the id selector: $("#id") 
	// ...or the class selector: $(".class")
	// More examples of selectors: http://www.w3schools.com/jquery/jquery_selectors.asp
	// More examples of events: http://www.w3schools.com/jquery/jquery_events.asp

	// jQuery Effects:
	// show(), hide(), toggle()
	// fadeIn(), fadeOut(), fadeToggle()
	// slideDown(), slideUp(), slideToggle()

	$("#boxButton").click(function(){
		$("#box1").fadeToggle(500).css("display","inline-block");
		$("#box2").fadeToggle(1000).css("display","inline-block");
		$("#box3").fadeToggle(1500).css("display","inline-block");
		$("#box4").fadeToggle(2000).css("display","inline-block");
		$("#box5").fadeToggle(2500).css("display","inline-block");
		$("#box6").fadeToggle(3000).css("display","inline-block");
		$("#box7").fadeToggle(3500).css("display","inline-block");
	});

	$(".even_li").click(function(){
		$("h1").slideToggle();
	});

	// Animate the boxes by clicking the last one
	// Notice .animate({parameters},speed,callback)
	// The callback comes up AFTER the animation is finished
	// You could also HALT animations/effects with .stop()
	$("#box7").click(function(){
		$(this).animate({
			width: '150px',
			height: '150px'
		});
		$("#box4").animate({
			width: '30px',
			height: '30px'
		});
		$("#box2").animate({
			width: '150px',
			height: '150px'
		},'slow',function(){
			alert('animation: DONE');
		});
	});

	// Get Content: text(), html(), val(), attr("href"), 
	$("h1").click(function(){
		alert("This says: " + $(this).html());
	});

	// Set Contents/Attributes
	$(".odd_li").click(function(){
		$(".odd_li").text("ODDS!");
	});

	$("figcaption").click(function(){
		$(this).attr("id","figgy");
		$("#figgy").text("FIGGY!!!");
	});




// CLOSE THE DOCUMENT READY EVENT
});