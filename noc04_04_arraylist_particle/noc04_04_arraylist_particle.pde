ArrayList<Particle> particles;

void setup() {
  size(640,360);
  
  //p = new Particle(new PVector(width/2, 10));
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  
  PVector force = new PVector(random(-0.1,0.1),random(0.1,0.1)); 
  
  particles.add(new Particle(new PVector(width/2, 50)));
  
  for (int i=particles.size()-1;i>=0;i--) {
    Particle p = (Particle)particles.get(i);
    
    p.run(force,0.05);
 
    if (p.isDead()) {
      particles.remove(i);
    }    
    
  }
 
    
}