//variable for width
let w;

//object arrays
var mycirc = [];
var myattract = [];

//variables for how many circles and attractros
var num;
var randattract;

function setup() {
  pixelDensity(1);

  //create a randomseed from the fxrand() value
  randomSeed(fxrand() * 999999);
  //randomSeed (100);

  //create canvas window size and canvas
  w = min(windowWidth, windowHeight);
  createCanvas(w, w);

  //populate circles
  num = int(random(1000));
  for (let i = 0; i < num; i++) {
    let x = random(0, width);
    let y = random(0, height);
    let s = random(10, 50);

    mycirc.push(new circ(x, y, s));
  }

  //populate attractors
  randattract = int(random(20));
  for (let i = 0; i < randattract; i++) {
    let x = random(0, width);
    let y = random(0, height);
    let s = random(10, 300);

    myattract.push(new attractor(x, y, s));
  }

  background(255);
}

function draw() {
  // background(255);

  strokeWeight(1);

  for (let i = 0; i < mycirc.length; i++) {
    mycirc[i].circdraw();
  }

  //stop the code and call the preview function - used to create images for trading
  if (frameCount > 300) {
    noLoop();
    fxpreview();
  }
}

//resize function
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

//circle class
class circ {
  constructor(x, y, s) {
    this.loc = createVector(x, y);
    this.vel = createVector(random(-1, 1), random(-1, 1));
    this.acc = createVector(0, 0);

    this.s = s;
  }

  circ() {}

  circdraw() {
    noFill();
    stroke(0, 2);
    ellipse(this.loc.x, this.loc.y, this.s, this.s);
    stroke(0, 10);

    point(this.loc.x, this.loc.y);
    this.prox();

    this.loc.add(this.vel);
  }

  prox() {
    //if circles near each other
    for (let i = 0; i < mycirc.length; i++) {
      let cdist = dist(
        this.loc.x,
        this.loc.y,
        mycirc[i].loc.x,
        mycirc[i].loc.y
      );
      let mindist = (this.s + mycirc[i].s) / 2;

      if (cdist <= mindist && cdist > 0) {
        stroke(0, 10);
        strokeWeight(0.5);
        line(this.loc.x, this.loc.y, mycirc[i].loc.x, mycirc[i].loc.y);
      }
    }

    //if circles near attractor
    for (let i = 0; i < myattract.length; i++) {
      let cdist = dist(this.loc.x, this.loc.y, myattract[i].x, myattract[i].y);
      let mindist = (this.s + myattract[i].s) / 2;

      if (cdist <= mindist && cdist > 0) {
        let cpos = createVector(myattract[i].x, myattract[i].y);
        this.acc = p5.Vector.sub(cpos, this.loc);
        this.acc.setMag(0.35);

        this.vel.add(this.acc);
        this.vel.limit(1);
        this.loc.add(this.vel);
      }
    }
  }
}

//simple attractor class - holds position and size
class attractor {
  constructor(x, y, s) {
    this.x = x;
    this.y = y;
    this.s = s;
  }
}
