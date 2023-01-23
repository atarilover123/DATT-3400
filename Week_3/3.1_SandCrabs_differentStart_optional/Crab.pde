class Crab {

  float posx;
  float posy;

  float opx;
  float opy;

  float step = random(2, 20);
  float eatit = random(1, 10);

  float gather = eatit+3;


  Crab(float posx, float posy, float step) {
    this.posx = posx;
    this.posy = posy;
    this.step = step;

    opx = posx;
    opy = posy;
  }

  void crabmove() {
    posx += random(-step, step);
    posy += random(-step, step);


    noStroke();
    fill(255, alpha);
    ellipse(posx, posy, 3, 3);
    //stroke(255, alpha*2);
    //strokeWeight(0.5);
    //line(posx, posy, opx, opy);
  }

  void eatFood() {
    for (int i = mycrab.size()-1; i >= 0; i--) {

      for (int j = 0; j < fnum; j++) {

        if (dist(mycrab.get(i).posx, mycrab.get(i).posy, crabfood[j].x, crabfood[j].y) <= eatit && crabfood[j].eaten == false) {


          float ru = eatit*sqrt(random(1));
          float rtheta = random(1) * 2 * PI;


          crabfood[j].x = opx+ru*cos(rtheta);
          crabfood[j].y = opy+ru*sin(rtheta);

          posx = opx;
          posy = opy;


          crabfood[j].eaten = true;
        }
      }
    }
  }

  boolean amiFood(int i) {
    boolean eat = false;

    for (int j = 0; j < pnum; j++) {

      if (dist(mycrab.get(i).posx, mycrab.get(i).posy, bigscary[j].pos.x, bigscary[j].pos.y) <= 50) {
        bigscary[j].acx = mycrab.get(i).posx;
        bigscary[j].acy = mycrab.get(i).posy;

        if (dist(mycrab.get(i).posx, mycrab.get(i).posy, bigscary[j].pos.x, bigscary[j].pos.y) <= 10) {
          stroke(255, 100, 200);
          line(mycrab.get(i).posx, mycrab.get(i).posy, bigscary[j].pos.x, bigscary[j].pos.y);

          stroke(100, 200, 30);
          noFill();
          ellipse(bigscary[j].pos.x, bigscary[j].pos.y, 50, 50);

          eat = true;
        }
      }
    }
    return eat;
  }
}
