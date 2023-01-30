//particle object

//if you are finding it hard to understand the vector movements in this section
//take a look at
//https://github.com/atarilover123/DATT-2400-CreativeCoding-I/blob/main/Week_3/PVectors/E1__acceleratetowardsmouse/E1__acceleratetowardsmouse.pde
//this is from DATT2400 and shows the attraction movement mechanic

//more info on PVectors here:
//https://natureofcode.com/book/chapter-1-vectors/

class Part {

  //create vectors for position, velocity and acceleration
  PVector pos = new PVector(random(width), random(height));
  PVector vel  = new PVector(0, 0);
  PVector acc;

  //create a PVector to hold the original particle start position
  PVector op;

  //variable to hold limit value - this is used to limit the magnitude of a vector
  float limit = random(0.2);

  Part() {
    //hold original xy location
    op = new PVector(pos.x, pos.y);
  }

  //particle display method
  void pd() {
    // op = new PVector(pos.x, pos.y);
    point(pos.x, pos.y);
  }


  //forces methid - calculate and apply forces
  void forces() {

    //loop through all the magnets to see if this particle is near any of them
    for (int i = 0; i < magnet.length; i++) {

      //PVectors calculate at the magnet edges - positive and negative sides
      PVector pp = new PVector((magnet[i].px+magnet[i].w/4)-magnet[i].w/4, magnet[i].py+magnet[i].h/4, 0);
      PVector np = new PVector((magnet[i].nx+magnet[i].w/4)+magnet[i].w/4, magnet[i].ny+magnet[i].h/4, 0);

      //unused visual styling

      /*
      stroke(0);
       line(pp.x,pp.y,np.x,np.y);
       
       noStroke();
       ellipse(pp.x, pp.y, magnet[i].rad/5, magnet[i].rad/5);
       ellipse(np.x, np.y, magnet[i].rad/5, magnet[i].rad/5);
       */

       //if the particle position is within a magnets radius and bigger than the magnets central point
       //distance is calculated using the PVector dist method
       
       //positive pole
      if (pos.dist(pp) <= magnet[i].rad && pos.dist(pp) >= magnet[i].cent) {
      
        //move towards point
        PVector acc = PVector.sub(pp, pos);
        acc.normalize();
        acc.mult(0.1);

        vel.add(acc);

        vel.limit(limit);

        pos.add(vel);
      }

      //do the same for the negative pole
      if (pos.dist(np) <= magnet[i].rad && pos.dist(np) >= magnet[i].cent) {

        PVector acc = PVector.sub(np, pos);
        acc.normalize();
        acc.mult(0.1);

        vel.add(acc);

        vel.limit(limit);

        pos.add(vel);
      } 
      
      //if the particle is not influenced by a magnet it is pulled back to it's start
      else {

        PVector acc = PVector.sub(op, pos);
        acc.normalize();
        acc.mult(0.01);

        vel.add(acc);

        vel.limit(limit);

        pos.add(vel);
      }
    }
  }
}
