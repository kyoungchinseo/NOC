class ParticleSystem
{
  ArrayList<Particle> particles;
  
  PVector origin;
  
  int numLife;
  
  ParticleSystem(PVector location) {
    numLife = 100;
    particles = new ArrayList<Particle>();
    origin = location.get();    
    
  }
  
  void addParticle() { 
    particles.add(new Particle(origin));
    numLife -= 1;
  }
  
  void run() {    
    if (numLife >0) {      
      addParticle();
    }
    
    Iterator<Particle> it = particles.iterator();
    
    while(it.hasNext()) {      
      PVector force = new PVector(random(-0.1,0.1),random(0.1,0.1)); 
      Particle p = it.next();
      p.run(force,0.01);
      if (p.isDead()) {
        it.remove();
      }
    }    
  }  
  
  boolean isDead() {
    if (particles.size() <= 0) {
      return true;
    } else {
      return false;
    }
  }
}