import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;

Surface surface;

Box2DProcessing box2d;

void setup() {
  size(640,360);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  boxes = new ArrayList<Box>();
  
  surface = new Surface();
  
}

void draw() {
  background(255);
  
  box2d.step();
  
  Box box = new Box(mouseX, mouseY, random(10,20),random(10,20));
  boxes.add(box);
  
  for (Box b: boxes) {
    b.display();
  }  

  surface.display();  
}