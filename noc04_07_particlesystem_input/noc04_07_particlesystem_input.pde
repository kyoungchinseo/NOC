import java.util.Iterator; // <<< -- import to use iterator

ParticleSystem ps;

void setup() {
  size(640,360);
  
  //particles = new ArrayList<Particle>();
  PVector location = new PVector(width/2,50);
  ps = new ParticleSystem(location);
}

void draw() {
  background(255);
  
  PVector newLoc = new PVector(mouseX,mouseY);  
  
  ps.run(newLoc);    
}