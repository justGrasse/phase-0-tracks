$(document).ready(function(){

	$(".buttonBox").fadeIn('slow');
	$(".buttonBox").css('display','block');
	$(".buttonBox p").fadeIn('slow');

	// Create a message to toggle the 'p' message
	// 		when hovering over the button.	
	function toggleMessage(button,message){
		$(button).hover(
			function(){
				var $prev = $(button).siblings();
				$prev.data('initialText', $prev.text());
				$prev.text(message);
			},
			function(){
				var $prev = $(button).siblings();
				$prev.text($prev.data('initialText'));
			}
		);
	}

	// Call toggleMessage:
	toggleMessage("#greenButton","Want to see some Headers?");
	toggleMessage("#redButton","Want to see some Paragraphs");
	toggleMessage("#blueButton","Want to see a Menu?");

	$("#greenButton").click(function(){
		$("h1").fadeIn(1000);
		$("h2").fadeIn(2000);
	});

	$("#redButton").click(function(){
		$("h1").siblings("p").slideDown(1000);
		$("h2").siblings("p").slideDown(2000);
	}); 

	$("#blueButton").click(function(){
		$("li").slideDown(1000);
	}); 

	// Color Shifter

	function colorShifter(shiftable){
		var colors = ['red','orange','yellow','green','bue','indigo','violet'];
		// On Click
		shiftable.click(function(){
			// Select a Random Rainbow color
			var randColor = colors[Math.floor(Math.random() * colors.length)];
			// Apply color to CSS
			shiftable.css("color",randColor);
		})
	}

	// Call Color Shifter on EVERYTHING!!!
	colorShifter($("h1"));
	colorShifter($("h2"));
	colorShifter($("h1").siblings("p"));
	colorShifter($("h2").siblings("p"));
	colorShifter($("li"));



});