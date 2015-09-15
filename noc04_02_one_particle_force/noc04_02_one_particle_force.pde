Particle p;

void setup() {
  size(640,360);
  
  p = new Particle(new PVector(width/2, 10));
}

void draw() {
  background(255);
  
  PVector force = new PVector(random(-0.1,0.1),random(0.1,0.1)); 
  
  p.run(force);
  
  if (p.isDead()) {
    println("Particle dead");
  }
}