// Declare function reverse
function reverse(str){
	// Declare an empty string variable
	var newStr = "";
	// Loop through each character of the string
	for (i = 0; i < str.length; i++){
		// Add each character to the new string starting from the end
		newStr += str[str.length-1-i];
		// console.log("this is i: " + i + " and this is newStr: " + newStr)
	}
	// return the new string
	return newStr;
}

console.log(reverse("hello"));