//tasks:

//1
//create 10 or more versions of the Agent class
//the easiest way to do this is by using an array - look at the "OOP_DATT3400" example

//2 
//Place each circle at a different randomly assigned position 
//Have each circle be a different randomly assigned size

//3 
//If you are comfortable with the first two tasks make the circles move on the scree

Agent myagent;

void setup() {
  size(600, 600);

  myagent = new Agent();
}

void draw() {
  background(0);
  myagent.draw_agent();
}

void mousePressed() {
  myagent = new Agent();
}

class Agent {

  float x;
  float y;
  float esize;

  Agent() {

    this.x = width/2;
    this.y = height/2;

    this.esize = random(30, 200);
  }

  void draw_agent() {
    noStroke();
    ellipse(x, y, esize, esize);
  }
}
