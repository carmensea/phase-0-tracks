//for each letter in a given string
//starting at the last letter
//add it to the front of the string
//until you've cycled through the lenght of it

var response = 0;

function reverse(string) {
  var newString = '';
  for (i = string.length - 1; i >= 0; i--){
    newString += string[i];
  }
  return newString;
}

response = reverse("hello");

if ( 1 == 1) {
  console.log(response);
}
