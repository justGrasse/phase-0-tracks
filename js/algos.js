// DOMAIN LOGIC //

// FIND LONGEST STRING METHOD
// Declare function to grab the longest string
function grabLongString(strArr){
	// Declare the longest string to find <empty>
	var longString = "";
	// Iterate through each element of the array
	for (str in strArr){
		// If the string is longer than the longest, change it!
		if (strArr[str].length > longString.length){
			longString = strArr[str];
		}
	}
	// Return the longest string
	return longString;
}

// FIND A KEY-VALUE MATCH
// Declare a function to check if any key-value's match
	// Initialize a check value to false
	// Iterate through each key of the first object
		// Check if the key-value pair exists in second object
		// If there is a match return check value set to true 


// DRIVER CODE //

var phraseArr = ["long phrase","longest phrase","longer phrase"];
longPhrase = grabLongString(phraseArr);
console.log(longPhrase);

var nameArr = ["Mr. Bean","Old Greg","John Jacob Jingle Heimerschmidt"];
longName = grabLongString(nameArr);
console.log(longName);

var electionArr = ["the first election",
	"Election of 1886",
	"The THANK GOD it's FINALLY IS OVER ELECTION of 20 FRIGGN 16"];
longElection = grabLongString(electionArr);
console.log(longElection);