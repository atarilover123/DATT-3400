void setup() {
  size(500, 500);
  background(0);
}

float inc = 0;
int max = 50;

void draw() {
  //opacity hack
  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);
  //

  if (mousePressed) {
    inc+=0.5;
    inc = constrain(inc, 0, max);

    fill(255);
    ellipse(mouseX, mouseY, inc, inc);
  } else {
    inc = 0;
  }
}
