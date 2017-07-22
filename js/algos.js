//input: array of words
//output: longest word
//loop through each item in the array
//compare length of characters from first item against second item
//if the first item is bigger
//check it against the third item
//continue looping through until all items are checked
//return biggest item

function longestWord(array){
  var newArray = [];
  newArray.push(array[0]);
  for (var i = 1; i <= array.length-1; i++){
    if (array[i].length > newArray[0].length){
     newArray[0] = array[i];
    }
  }
   return newArray;
}

//input: two objects
//output: boolean
//loop through each value in the first object
//compare if it is equal to the values in the second object
//if one is equal
//return true
//if both are not equal
//return false

function sameValues(object1, object2){
  for(var key in object1){
    if (object1['name'] == object2['name'] || object1['age'] == object2['age']){
      return true;
    }else{
      return false;
    }
  }
}

//input: integer for length
//output: array of strings
//create a string of the alphabet
//make a new string with a random length of 1 - 10 letters from alphabet
//do this integer amount of times

function wordMaker(integer){
  //create empty array to return
  var array = [];
  //alphabet 
  var alphabet = "abcdefghijklmnopqrstuvwxyz";
  //empty string
  //until you loop through the length of the integer
  for (var i = 0; i < integer; i++){
    var newWord = "";
    //generate a random number between 1 - 10
    var wordLength = Math.floor(Math.random() * 10) + 1;
    //until you loop through the length of the wordLength
    for (var j = 0; j < wordLength; j++){
    //generate a random number between 1 - 10
      var alphaWord = Math.floor(Math.random() * 26) + 1;
      newWord += alphabet.charAt(alphaWord);
  }
    array.push(newWord);
  }
  return array;
}

//add driver code that does the following 10 times: generates an array, prints the array, feeds the array to your "longest word" function, and prints the result.

var arrFeeder = ""
for (var i = 0; i < 10; i++){
  arrFeeder = wordMaker(5);
  console.log(arrFeeder);
  longestWord(arrFeeder);
}

//RELEASE DRIVER CODES BELOW>>>>
//wordMaker(3)

//console.log(wordMaker(3))
//
//console.log(sameValues({name: "Steven", age: 54}, {name: "Tamir", age: 54}));
//console.log(sameValues({name: "Mark", age: 54}, {name: "Mark", age: 50}));
//console.log(sameValues({name: "Tim", age: 54}, {name: "Tamir", age: 154}));

//console.log(longestWord(["ak", "monters", "catdogmousepeople", "cats", "chickkahfihdgsihgi"]));
//console.log(longestWord(["a", "ab", "abcde", "e"]));

