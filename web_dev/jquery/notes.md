BEFORE
1. Google JQuery basics and tricks
   Watch youtube tutorial on JQuery
   Pick a thing to do with JQuery
   Find how to do that thing
2. Write down some of the info
3. Use a prior html/css file to test on every time
   a method is learned
4. Take a break afer 1 hour to stretch and grab another
   glass of water.

AFTER
1. I read a basic tutorial on jQuery. After reading and taking notes
   (seen below), I decide to watch a video on youTube. 
2. youTube was a lot easier to understand. I did it in tandem with the 
   presenter. I feel like I learned a lot more from watching and doing than
   from just reading. 


jQuery stuff:

//this will test that your page is ready for jQuery
$(function() {
  console.log( 'ready!' );
});


//simple things you can do
//get some elements
//any selection of these you make will only contain
//elements that existed at the time you made the selection
//nothing new added will be included
$( '#header' ); //selects elements with ID of header
$( 'li' ); //selects all list items
$( 'ul li' ); //selects list items that are in unordered lists

//you can create an object from DOM
$( document.body.children[0] );
//make a selection in the context of a DOM element
var firstBodyChild = document.body.children[0];
$( 'li', firstBodyChild );

//you can test contents of your selection
//has to be a conditional, because objects are always
//returned and therefore truthy
if ( $( '#nonexisten').length ) {
}

