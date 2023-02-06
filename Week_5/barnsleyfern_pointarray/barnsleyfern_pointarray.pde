int num = 10000;
FP[] point;

void setup() {
  size(600, 600);
  background(0);

  strokeWeight(2);
  stroke(255);

  point = new FP[num];

  for (int i = 0; i < num; i++) {

    point[i] = new FP(drawPoint(), i);
    nextPoint();
  }
}

void draw() {
  background(0);

  //fill(0, 120);
  //noStroke();
  //rect(0, 0, width, height);

  for (int i = 0; i < num; i++) {
    point[i].fernpoint();
    point[i].attractor();
  }
}

class FP {
  int id;
  int count;

  //vectors for position and origin
  PVector pos;
  PVector opos;

  //vector for connections
  PVector connect;

  //vectors for acceleration and velocity
  PVector acc;
  PVector vel  = new PVector(0, 0);

  //random multiplication value - alters speed of movement
  float multival = random(1);

  //boolean check to see if two points are connected
  boolean cnt = false;

  //constructor
  FP(PVector pos, int id) {

    //position fed from setup
    this.pos = pos;
    opos = new PVector(pos.x, pos.y);

    //id of this object
    this.id = id;
    //count value set to id
    count = id;
  }

  //draw point in position
  void fernpoint() {
    stroke(255);
    strokeWeight(1);
    point(pos.x, pos.y);
  }

  //attractor to mouse and return to home (opos)
  void attractor() {
    PVector pp = new PVector(mouseX, mouseY, 0);

    //attract
    if (mousePressed && pos.dist(pp) <= 100) {

      PVector acc = PVector.sub(pp, pos);
      acc.normalize();
      acc.mult(multival);

      vel.add(acc);

      vel.limit(multival);

      pos.add(vel);
    }
    //return to opos
    else {
      if (pos.dist(opos) >= 2) {
        PVector acc = PVector.sub(opos, pos);
        acc.normalize();
        acc.mult(multival);

        vel.add(acc);

        vel.limit(multival*0.75);

        pos.add(vel);
      }
    }
  }
}
