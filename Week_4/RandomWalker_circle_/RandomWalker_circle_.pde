//modded version of the random walkers from W1 
//these walkers start at the center of a circle and are placed back in the center 
//if they touch the circles edge

///////////////////////////////////////////////////////////////////////////////////////

//create an object - Walker - this allows us to create multiple version
//(instances -- in this example called walk) of the code in the Walker object

//info on objects
//https://processing.org/tutorials/objects

//we user [] square brackets to identify that this Walker object is an array

//info on arrays
//https://processing.org/reference/Array.html
Walker[] walk;

//variable for circle size
int crad = 400;

//setup - an inbuilt processing function where we can define elements one time on setup
//e.g the size of the canvas - or any other values that we just want to set the one time
void setup() {

  //size of canvas
  size(500, 500);
  //background color
  background(255);

  //set the size of the array - the value in the [] is how many Walker objects we will create
  walk = new Walker[70];

  //Use a for loop to access every index of the array and populate each random walker with x,y and speed values.
  //the values are fed into the object constructor
  for (int i = 0; i < walk.length; i++) {
    walk[i] = new Walker(width/2,height/2, random(5));
  }
  
  //draw a visual of the circle
  ellipse(width/2,height/2,crad,crad);
}

void draw() {

  //for loop to access and visualise each random walker
  for (int i = 0; i < walk.length; i++) {
    //visualise the draw_walk() function of the walker object - do this for every instance in the array
    walk[i].draw_walk();

    //check the distance between walkers - we do this with a second loop.

    for (int j = 0; j < walk.length; j++) {
      //we check index i against all the other random walker positions - accessed using index j

      //if else statement using the dist function

      //info on the dist function - https://processing.org/reference/dist_.html

      //if the distance is less than the drawline variable the code will connect the positions using a line

      int drawline = 20;

      if (dist(walk[i].x, walk[i].y, walk[j].x, walk[j].y) <= drawline & dist(walk[i].x, walk[i].y, walk[j].x, walk[j].y) >= 10) {
        stroke(0, 50);
        strokeWeight(0.2);
        line(walk[i].x, walk[i].y, walk[j].x, walk[j].y);
      }
    }
  }
}

//the walker object
class Walker {

  //position and speed variables

  int x;
  int y;

  float speed;
  
  //randomly select a size for the ellipse
  float esize = random(4);

  //color data type
  color c = color(random(255), random(255), random(255), random(255));

  //constructor - we can feed values here from the setup part of the code.
  Walker(int x, int y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  //create a function to draw and visualise the random walker
  void draw_walk() {
    //some design styling
    //remove the stroke surrounding the ellipse
    noStroke();

    //fill the ellipse with the color datatype c
    fill(c);

    ellipse(x, y, esize, esize);

    //random walker position
    x = x+int( random(-speed, speed) );
    y = y+int( random(-speed, speed) );
    
   //constrain x - y to a circle
   //we can use dist again to calculate the distance from a central point 
   //- if we exceed that centre point something happens
   //in this case the walker goes back to the centre 
   
   //first two values are the x,y moving point 
   //and the next two value are the centre point value 
   
   
   float boundary = dist(x,y,width/2,height/2);
   
   //for the if statement we divide the boundary diameter by 2 to get the radius of the circle
   //we can check if the x,y point goes outside the circle using this.
   if(boundary >= crad/2){
    //do something...
    
    //return to center
    x = width/2;
    y = height/2;
     
     
   }
   
   
  }
}
