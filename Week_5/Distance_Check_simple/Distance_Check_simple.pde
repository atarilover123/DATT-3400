float x, y;

void setup() {
  size(600, 600);

  x = random(width);
  y = random(height);
}

int diam = 300;

void draw() {
  background(0);

  float d = dist(mouseX, mouseY, x, y);

  println(d);

  if (d <= diam/2) {
    fill(100, 200, 255);
  } else {
    fill(255);
  }

  ellipse(x, y, diam, diam);
}

void mousePressed() {
  x = random(width);
  y = random(height);
}
