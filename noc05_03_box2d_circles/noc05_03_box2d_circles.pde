import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Circle> circles;

Box2DProcessing box2d;

void setup() {
  size(640,480);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  circles = new ArrayList<Circle>();
  
}


void draw() {
  background(255);
  
  box2d.step();
  
  Circle circle = new Circle(mouseX, mouseY, random(10,30));
  circles.add(circle);
  
  for (Circle c: circles) {
    c.display();
  }  
  
}