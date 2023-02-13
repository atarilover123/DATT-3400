let walker = [];
let num = 100;

function setup() {
  createCanvas(700, 700);

  for (let i = 0; i < num; i++) {
    walker.push(new Walkers(random(width), random(height)));
  }
}

function draw() {
  //background(244);

  for (let i = 0; i < walker.length; i++) {
    walker[i].mover();
    walker[i].connector();
  }
}

//walker class
class Walkers {
  
  
  constructor(x, y) {
    this.x = x;
    this.y = y;

    this.startx = x;
    this.starty = y;

    this.step = random(5);

    this.size = random(10);
    
    this.c = color(random(255), random(255), random(255));
  }

  mover() {
    this.x += random(-this.step, this.step);
    this.y += random(-this.step, this.step);

    if (this.x >= width || this.x < 0) {
      this.x = this.startx;
    }

    if (this.y >= height || this.y < 0) {
      this.y = this.starty;
    }

  noFill();
    stroke(0,10)
    ellipse(this.x, this.y, this.size, this.size);
    stroke(this.c);
    
  }

  connector() {
    for (let i = 0; i < walker.length; i++) {
      if (dist(this.x, this.y, walker[i].x, walker[i].y) <= 20) {
        line(this.x, this.y, walker[i].x, walker[i].y);
      }
    }
  }
}
