int fnum = 700;

int pnum = 10;
//create object arrays for all elements
Food[] crabfood = new Food[fnum];

Predator[] bigscary = new Predator[pnum];

int numcrabs = 100;
//use an ArrayList to handle our crabs
ArrayList<Crab> mycrab;


void setup() {
  size(700, 700);
  background(0);

  mycrab = new ArrayList<Crab>();

  for (int i = 0; i < fnum; i++) {
    crabfood[i] = new Food();
  }

  for (int i = 0; i < pnum; i++) {
    bigscary[i] = new Predator();
  }

  for (int i = 0; i < numcrabs; i++) {
    mycrab.add (new Crab(random(width), random(height)));
  }
}

void draw() {

  background(0);

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
    }
  }

  //show the food
  for (int i = 0; i < fnum; i++) {
    crabfood[i].showFood();
  }
}
