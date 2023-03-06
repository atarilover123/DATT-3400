let w;
let m = 1;
let div = 1000;

//variable to hold random seed
let seed; 

function setup() { 
  w = min(windowWidth, windowHeight);
  
  m = w/div;
  //print(m);

  seed = fxrand()*99999;
  
  createCanvas(w,w);
  
  randomSeed(seed);
} 

function draw() { 
  //draw something cool. Replace with your own code
  background(220);
  for(let i = 0; i < 10; i++){
  circle(random(div)*m,random(div)*m, random(150) * m);}
  
  noLoop();
}

// scale when the canvas changes size  
function windowResized() {
   w = min(windowWidth, windowHeight);
    m = w/div;
  
  //print(m);
  resizeCanvas(w,w);
  
  randomSeed(seed);  
}