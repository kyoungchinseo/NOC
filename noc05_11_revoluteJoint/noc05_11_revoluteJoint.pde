import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Windmill windmill;

ArrayList<Particle> particles;

void setup() {
  size(640,360);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
   
  
  windmill = new Windmill(width/2, 175);
  
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);

  if (random(1) < 0.1) {
    float sz = random(4,8);
    particles.add(new Particle(random(width/2-100,width/2+100),-20,sz));
  }


  // We must always step through time!
  box2d.step();

  // Look at all particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (p.done()) {
      particles.remove(i);
    }
  }

  // Draw the windmill
  windmill.display();
  
  String status = "OFF";
  if (windmill.motorOn()) status = "ON";
  
  fill(0);
  text("Click mouse to toggle motor.\nMotor: " + status,10,height-30);
  

}

void mousePressed() {
  windmill.toggleMotor();
}