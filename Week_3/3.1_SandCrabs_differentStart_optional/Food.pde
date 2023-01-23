class Food{
  
  // food position
  float x;
  float y;
  
  boolean eaten = false;
  
  Food(float x, float y){
   this.x = x;
   this.y = y;
  }
  
  void showFood(){
   stroke(255);
   strokeWeight(1);
   point(x,y);
  }
}
