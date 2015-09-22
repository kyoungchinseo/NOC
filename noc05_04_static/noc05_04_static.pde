import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;
ArrayList<Boundary> boundaries;

Box2DProcessing box2d;

void setup() {
  size(640,480);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  
  setBoundary();
  
}

void draw() {
  background(255);
  
  box2d.step();
  
  Box box = new Box(mouseX, mouseY, random(10,20),random(10,20));
  boxes.add(box);
  
  for (Box b: boxes) {
    b.display();
  }  

  for (Boundary b: boundaries) {
    b.display();
  }
  
}


void setBoundary() {
  Boundary b1 = new Boundary(0,height-10,width*2/5,10);
  boundaries.add(b1);
  
  Boundary b2 = new Boundary(width*3/5, height-100, width/2, 10);
  boundaries.add(b2);
}