Mover mover;

void setup() {
  size(400,400);
  smooth();
  background(255);
  mover =new Mover();
}

void draw() {  
  background(255);
    
  mover.update();
  mover.checkEdges();
  mover.display();    
}

void keyPressed() {
  if (keyCode == LEFT) {    
    mover.addLeftAccel();
  } else if (keyCode == RIGHT) {
    mover.addRightAccel();
  }
}