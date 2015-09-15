import java.util.Iterator; // <<< -- import to use iterator

Astroid astroid;
ParticleSystem booster;

color c = color(0,0,0);

void setup() {
  size(640,640);
  background(255);
  
  astroid = new Astroid();  
  
  PVector boosterLoc = astroid.location.get();
  booster = new ParticleSystem(boosterLoc);
}

void draw() {
  background(255);
  astroid.update();
  astroid.checkEdges();
  astroid.display();
  
  PVector location = new PVector(astroid.location.x, astroid.location.y+35);
  booster.run(location, astroid.velocity);
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