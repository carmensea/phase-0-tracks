var colors = ["blue", "red", "green", "yellow"];

var names = ["Ed", "Bob", "Sue", "Tim"];

names.push("Carl");
colors.push("pink");

function horses(colors, names){ 
  horseAndcolors={}
  for (var i = 0; i < colors.length; i++) {
    horseAndcolors[names[i]] = colors[i]
  }
  return horseAndcolors;
}

//console.log(horses(colors, names));

function Car(color, speed, model){
  this.color = color;
  this.speed = speed;
  this.model = model;
  this.sound = function() { console.log
    ("Vroom!"); };
  console.log("CAR INITIALIZATION COMPLETE");
}

var firstCar = new Car("red", "55", "honda");
console.log(firstCar);
firstCar.sound();

var secondCar = new Car("blue", "45", "toyota");
console.log(secondCar);
secondCar.sound();

var thirdCar = new Car("purple", "65", "acura");
console.log(thirdCar);
thirdCar.sound();


