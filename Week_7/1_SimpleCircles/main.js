
function setup() {
randomSeed (fxrand()*100);
//randomSeed (100);
createCanvas(800, 800);
 
}

function draw() {
background(255);
var num = int(10+fxrand()*50);
for(var i = 0; i < num; i++){

let x = random(0,width);
let y = random(0,height);
  ellipse(x,y,20,20)
}

 noLoop();

 //print(num);
 text(fxhash,30,30);
}

