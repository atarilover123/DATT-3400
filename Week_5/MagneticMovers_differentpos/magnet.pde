//magnet object

class Mag {
  
  //width, height, position xy
  float w = random(200);
  float h = random(50);

  float x = random(width);
  float y = random(height);
  
  //variables for positive and negative poles
  float px, py;
  float nx, ny;

  //rad = radius of attraction 
  //cent = attraction stops at a radius around central point
  float rad = random(50, 300);
  float cent = random(5, 20);
 
 //constructor - set up positive and negative pole locations
  Mag(int x, int y) {
    
    this.x = x;
    this.y = y;
    //pos
    px = x-(w/2);
    py = y;

    //neg
    nx = x;
    ny = y;
  }

  //magnet display - use this method to display magnets in main
  void md() {

    //pos
    //noFill();
    fill(250,230,5,10);
    rect(px, py, w/2, h/2);
    fill(250,5,222,10);
    ellipse(px, py+h/4, h/2, h/2);

    //negative
     fill(250,230,5,10);
    rect(nx, ny, w/2, h/2);
     fill(250,5,222,10);
    ellipse(nx+w/2, ny+h/4, h/2, h/2);
  }
}
