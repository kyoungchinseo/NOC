Mover mover;

void setup() {
  size(400,400);
  smooth();
  background(255);
  mover = new Mover();
}

void draw() {
  
  if (keyPressed == true) {
    mover.increase();
  } else {
    mover.decrease();
  }
  
  mover.update();
  mover.checkEdges();
  mover.display();  
}