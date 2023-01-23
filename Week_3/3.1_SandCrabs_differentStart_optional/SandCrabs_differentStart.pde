int fnum = 3000;

int pnum = 5;
//create object arrays for all elements
Food[] crabfood = new Food[fnum];

Predator[] bigscary = new Predator[pnum];

int numcrabs = 50;
//use an ArrayList to handle our crabs
ArrayList<Crab> mycrab;

int alpha = 25;

void setup() {
  size(700, 700);
  background(0);

  mycrab = new ArrayList<Crab>();

  int frad = 300;
  for (int i = 0; i < fnum; i++) {

    float r = frad*sqrt(random(1));

    float theta = random(1) * 2 * PI;

    float x = width/2+r*cos(theta);
    float y = height/2+r*sin(theta);

    crabfood[i] = new Food(x, y);
  }

int prad = 250;
  for (int i = 0; i < pnum; i++) {
    float x = width/2+sin(TWO_PI*i/pnum)*prad;
    float y = height/2+cos(TWO_PI*i/pnum)*prad;
    bigscary[i] = new Predator(x,y);
  }


int crad = 200;
  for (int i = 0; i < numcrabs; i++) {
    float x = width/2+sin(TWO_PI*i/numcrabs)*crad;
    float y = height/2+cos(TWO_PI*i/numcrabs)*crad;
    
    mycrab.add (new Crab(x,y,random(1,12)));
  }
}

void draw() {

  //background(0);

  for (int i = 0; i < pnum; i++) {
    bigscary[i].update();
    bigscary[i].display();
  }


  for (int i = mycrab.size()-1; i >= 0; i--) {
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Crab c = mycrab.get(i);
    c.crabmove();
    c.eatFood();

    if (c.amiFood(i) == true) {
      mycrab.remove(i);
      println(mycrab.size());
    }
  }

  //show the food
  for (int i = 0; i < fnum; i++) {
    crabfood[i].showFood();
  }
}
