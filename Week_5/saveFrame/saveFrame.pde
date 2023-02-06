float x; 
float y; 

void setup() {
  size(500, 500);
  background(0);
  
  x = width/2;
  y = height/2;
}

float step = 3.5;
void draw() {
  //opacity hack
  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);
  //
  
  x+= random(-step,step);
  y+= random(-step,step);
  
  fill(255);
  ellipse(x,y,10,10);
}

void keyPressed(){
  if (key == 's'){
  saveFrame("###_walker.jpg");
  }
}
  
