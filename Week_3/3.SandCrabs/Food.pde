class Food{
  
  // food position
  float x;
  float y;
  
  boolean eaten = false;
  
  Food(){
   x = random(width);
   y = random(height);
  }
  
  void showFood(){
   stroke(255);
   strokeWeight(1);
   point(x,y);
  }
}
