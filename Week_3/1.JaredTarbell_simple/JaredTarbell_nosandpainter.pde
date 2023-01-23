// Happy Place
// j.tarbell  March, 2004
// Albuquerque, New Mexico
// complexification.net

// Processing 0085 Beta syntax update
// j.tarbell   April, 2005

//simplified and annotated by Dan Tapper, January 2023

//how many agents
int num = 100;

//time - global variable to store an incremental value
int time = 0;

//an array of Friend objects - these are are moving agents
Friend[] friends;

//variable to hold dimension
int dim;

void setup() {
  size(800, 800, P3D);
  dim = width;

  background(0);

  //Create an array length for how many friend agents
  friends = new Friend[num];

  //Call the reset all function
  resetAll();
}

void draw() {
  // move friends to happy places

  //move and draw friends - use the move and expose_simple methods from the object
  for (int c=0; c<num; c++) {
    friends[c].move();
    friends[c].expose_simple();
  }

  //find happy places - only do this if the value of time%2 is = to 0
  if (time%2==0) for (int c=0; c<num; c++) {
    friends[c].findHappyPlace();
  }
  //increment time
  time++;
}

//press the mouse to call the resetAll function and run again
void mousePressed () {
  resetAll();
  background(0);
}

//resetAll function - sets up starting positions
//we can change parameters here to alter the shape
void resetAll() {
  // make some friend entities
  for (int x=0; x<num; x++) {
    float fx = dim/2 + 0.4*dim*cos(TWO_PI*x/num);
    float fy = dim/2 + 0.4*dim*sin(TWO_PI*x/num);
    friends[x] = new Friend(fx, fy, x);
  }

  // make some random friend connections
  for (int k=0; k<num*2.2; k++) {
    int a = int(floor(random(num)));
    int b = int(floor(a+random(22))%num);
    if (b>=num) {
      b=0;
      print("+");
    } else if (b<0) {
      b=0;
      print("+");
    }

    if (a!=b) {
      friends[a].connectTo(b);
      friends[b].connectTo(a);
      //println(a+" made friends with "+b);
    }
  }
}



// OBJECTS ---------------------------------------------------------------

//the Friend object

class Friend {
  //position and movement variables
  float x, y;
  float dx, dy;
  float vx, vy;
  //id holds the index value of each agent
  int id;

  //connection variables
  int numcon;
  int maxcon = 10;
  int lencon = 10+int(random(50));
  int[] connections = new int[maxcon];

  //color and strokeweight
  color myc = color(random(255), random(255), random(255));
  float sw =random(0.1, 1.4);

  //constructor
  Friend(float X, float Y, int Id) {
    // position
    dx = x = X;
    dy = y = Y;
    id = Id;

    numcon = 0;
  }

  //simple render
  void expose_simple() {
    strokeWeight(sw);
    stroke(myc);
    point(x, y);
  }

  //more complex render;
  void expose() {
    strokeWeight(sw);
    for (int dx=-2; dx<3; dx++) {
      float a = 0.5-abs(dx)/5.0;
      stroke(0, 256*a);
      point(x+dx, y);
      stroke(myc, 256*a);
      point(x+dx-1, y-1);
    }

    for (int dy=-2; dy<3; dy++) {
      float a = 0.5-abs(dy)/5.0;
      stroke(0, 256*a);
      point(x, y+dy);
      stroke(myc, 256*a);
      point(x-1, y+dy-1);
    }
  }

  void render() {
    for (int xx=int(x-numcon); xx<int(x+numcon); xx++) {
      for (int yy=int(y-numcon); yy<int(y+numcon); yy++) {
        stroke(myc);
        point(xx, yy);
      }
    }
  }

  void move() {
    // add velocity to position
    x+=vx;
    y+=vy;

    //friction
    vx*=0.92;
    vy*=0.92;
  }

  void connectTo(int f) {
    // connect to friend f

    // is there room for more friends?
    if (numcon<maxcon) {
      // already connected to friend?
      if (!friendOf(f)) {
        connections[numcon] = f;
        numcon++;
      }
    }
  }

  boolean friendOf(int x) {
    boolean isFriend = false;
    for (int n=0; n<numcon; n++) {
      if (connections[n]==x) isFriend=true;
    }
    return isFriend;
  }

  //we can use this to alter the structure of the movement
  void findHappyPlace() {
    // set destination to a happier place
    // (closer to friends, further from others)
    float ax = 0.0;
    float ay = 0.0;

    // find mean average of all friends and non-friends
    for (int n=0; n<num; n++) {
      if (friends[n]!=this) {
        // find distance
        float ddx = friends[n].x-x;
        float ddy = friends[n].y-y;
        float d = sqrt(ddx*ddx + ddy*ddy);
        float t = atan2(ddy, ddx);

        boolean friend = false;
        for (int j=0; j<numcon; j++) if (connections[j]==n) friend=true;
        if (friend) {
          // attract
          if (d>lencon) {
            ax += 4.0*cos(t);
            ay += 4.0*sin(t);
          }
        } else {
          // repulse
          if (d<lencon) {
            ax += (lencon-d)*cos(t+PI);
            ay += (lencon-d)*sin(t+PI);
          }
        }
      }
    }

    vx+=ax/42.22;
    vy+=ay/42.22;
  }
}

