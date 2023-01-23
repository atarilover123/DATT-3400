class Crab {

  float posx;
  float posy;

  float opx;
  float opy;

  float step = random(5);
  float gather = 5;

  Crab(float posx, float posy) {
    this.posx = posx;
    this.posy = posy;

    opx = posx;
    opy = posy;
  }

  void crabmove() {
    posx += random(-step, step);
    posy += random(-step, step);

    stroke(255);
    strokeWeight(1);
    fill(255);
    ellipse(posx, posy, 3, 3);

    strokeWeight(0.5);
    line(posx, posy, opx, opy);
  }

  void eatFood() {
    for (int i = mycrab.size()-1; i >= 0; i--) {

      for (int j = 0; j < fnum; j++) {

        if (dist(mycrab.get(i).posx, mycrab.get(i).posy, crabfood[j].x, crabfood[j].y) <= 5 && crabfood[j].eaten == false) {
          crabfood[j].x = opx+random(-gather, gather);
          crabfood[j].y = opy+random(-gather, gather);

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

        eat = true;}
      }
    }
    return eat;
  }
}
