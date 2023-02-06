//Dan Tapper, 2023
// a sketch using imaginary magnets to attract particles
//press the space bar to change the position of the magnetic attractors

//create object arrays for magnets and particles
Mag[] magnet;
Part[] particle;

void setup() {
  size(700, 700);
  background(0);

  //initialise object arrays and create objects
  magnet = new Mag[50];
  particle = new Part[10000];

  for (int i = 0; i < magnet.length; i++) {
    magnet[i] = new Mag(int(random(width)), int(random(height)));
  }

  for (int i = 0; i < particle.length; i++) {
    particle[i] = new Part();
  }
}

void draw() {

  //slowblur();

  //visualise magnet positions
  
  for (int i = 0; i < magnet.length; i++) {
   magnet[i].md();
   
   }
   

  //display particle objects and apply forces
  stroke(255);
  for (int i = 0; i < particle.length; i++) {
    particle[i].pd();
    particle[i].forces();
  }
  
}

void slowblur(){
  //styling - draw a square with a low fill opacity to create a blurry trail effect
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);}

//regenerate on keyPress
void keyPressed() {
if (key == 'a'){
  background(0);
  for (int i = 0; i < magnet.length; i++) {
    
    int rad = 200; 
    float xp = width/2+sin(i)*rad;
     float yp = height/2+cos(i)*rad;
    
    magnet[i] = new Mag(int(xp),int(yp));}
  }
  
  if (key == 'b'){
  background(0);
  for (int i = 0; i < magnet.length; i++) {
    
    
    magnet[i] = new Mag(int(random(width)), int(random(height)));}
  }
  
  if(key == 's'){
   saveFrame("MagOut/####mag_" + particle.length + " particles.jpg"); 
  }
}
