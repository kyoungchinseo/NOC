import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

ArrayList<Boundary> boundaries;

ArrayList<Pair> pairs;

void setup() {
  size(640,460);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  
  pairs = new ArrayList<Pair>();
  
  boundaries = new ArrayList<Boundary>();
  
  for(int x = 0; x< width; x=x+10) {
    boundaries.add(new Boundary(x,height*2/3 - cos(x/(float)width*360*PI/180)*height/4,10));
  } 
}

void draw() {
  background(255);
  box2d.step();
  
  for(Pair p: pairs) {
    p.display();
  }
  
  for(Boundary wall: boundaries) {
    wall.display();
  }
  
  fill(0);
  text("Click mouse to add connected particles.",10,20);
  
}

void mousePressed() {
  Pair p = new Pair(mouseX, mouseY);
  pairs.add(p);
}