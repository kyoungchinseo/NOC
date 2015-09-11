Astroid astroid;

color c = color(0,0,0);

void setup() {
  size(640,640);
  background(255);
  
  astroid = new Astroid();
}

void draw() {
  background(255);
  astroid.update();
  astroid.checkEdges();
  astroid.display();
  
}

void keyPressed() {
  if (keyCode == LEFT) {
    //astroid.addLeftAccel();
    astroid.addLeftTurn();
  } else if (keyCode == RIGHT) {
    //astroid.addRightAccel();
    astroid.addRightTurn();
  } else if (key == 'z' || key == 'Z') {
    astroid.applyForce();
  }
}