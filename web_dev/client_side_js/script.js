console.log("Script is running!");

function borderOcto(event) {
  console.log("After the event");
  console.log(event);
  event.target.style.border = "9px solid blue";
  photos[0].hidden = true;
}

var photos = document.getElementsByTagName("img");
photos[1].addEventListener("click", borderOcto);


function moveOcto(event) {
    setTimeout(function(){photos[2].style.marginLeft = "500px"; }, 500);
    setTimeout(function(){photos[2].style.marginLeft = "550px"; }, 1000);
    setTimeout(function(){photos[2].style.marginLeft = "400px"; }, 1500);
    setTimeout(function(){photos[2].style.marginLeft = "600px"; }, 2000);
    setTimeout(function(){photos[2].style.marginLeft = "500px"; }, 2500);
    setTimeout(function(){photos[2].style.marginLeft = "450px"; }, 3000);
    setTimeout(function(){photos[2].style.marginLeft = "auto"; }, 3000);

}

photos[2].addEventListener("click", moveOcto);
