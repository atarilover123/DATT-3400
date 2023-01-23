class Predator {

  PVector pos;
  PVector acc;
  PVector vel;
  
  float acx = 0;
  float acy = 0;
  
  int framemod = int(random(200));
  
  float scale = 0.001; 
  float magnitude=1.3;


  Predator() {
    pos=new PVector(random(width), random(height));
    acc = new PVector();
    vel=new PVector();
   
  }

  void update() {
   
    float noiseValue=noise(pos.x*scale, pos.y*scale);
    float angle=noiseValue*TWO_PI*100+frameCount*0.1;
    vel.set(cos(angle)*magnitude, sin(angle)*magnitude);
    
    PVector cpos = new PVector(acx,acy);
    acc = PVector.sub(cpos,pos);
    
    if(frameCount%framemod >= framemod-1){
       scale = random(0.001);//you can change this
       magnitude=random(1.3);
     cpos = new PVector(random(width),random(height));
    acc = PVector.sub(cpos,pos);
      
    }
    
    acc.normalize();
    acc.mult(0.4);

  
    vel.add(acc);
    vel.limit(4);
    
    pos.add(vel);
    
    
    if (pos.x<0 || pos.x>1000 || pos.y<0 || pos.y>height) {
      pos.set(random(width), random(height));
    }
  }

  void display() {
    noStroke();
    fill(255, 100, 200);

    ellipse(pos.x, pos.y, 7, 7);
  }
}
