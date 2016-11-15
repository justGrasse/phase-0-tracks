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
function shareProp(obj1, obj2){
	// Iterate through each key of the first object
	for (var key in obj1){
		// Check if the key-value pair exists in second object
		if(obj1[key] == obj2[key]){
		// If there is a match return true
			return true;
		}
	}
	// Return false otherwise 
	return false;
}

// GENERATE A RANDOM ARRAY OF RANDOM STRINGS

// Random integer function
function randInt(num){
	// Return a random number from 1 to 10
	return Math.floor(Math.random() * num + 1);
}

// Declare a function to build a random string array
function randArr(num){
	// Initialize a random array <empty>
	var randomArr = [];
	// Declare the alphabetALPHABET!
	var alpha = "abcdefghijklmnopqrstuvwxyz";
	alpha += alpha.toUpperCase();
	// Iterate n times per input
	for (var i = 0; i < num; i++){
		// Choose a random number between 1 and 10
		randomNum = randInt(10);
		//Initialize a string <empty>
		var newStr = "";
			//Iterate random n times
			for (var j = 0; j < randomNum; j++){
				// Push a random letter to the random string
				newStr += alpha[randInt(alpha.length)-1];
			}
		// Push the random assembled string to the random array
		randomArr.push(newStr);
	}
	// Return the random array
	return randomArr;
}



// DRIVER CODE //

var phraseArr = ["long phrase","longest phrase","longer phrase"];
longPhrase = grabLongString(phraseArr);
console.log(longPhrase);

var nameArr = ["Mr. Bean","Old Greg","John Jacob Jingle Heimerschmidt"];
longName = grabLongString(nameArr);
console.log(longName);

var electionArr = ["the first election",
	"Election of 1886",
	"The THANK GOD it's FINALLY IS OVER ELECTION of 20-FRIGGN'-16"];
longElection = grabLongString(electionArr);
console.log(longElection);

var user1 = {name: "Steven", age: 54, surname: "Universe"}; 
var user2 = {name: "Tamir", age: 54};
console.log("This should be true: " + shareProp(user1,user2));

var movie1 = {title: "Halloween", genre: "horror", hasSeen: true}; 
var movie2 = {title: "Boo: A Madea Halloween", genre: "comedy", hasSeen: false};
console.log("This should be false: " + shareProp(movie1,movie2));

console.log(randArr(3));
console.log(randArr(7));
