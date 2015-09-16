// particle system for explosion animation

class ParticleSystem
{
  ArrayList<Particle> particles;  
  
  PVector origin;
  
   
  ParticleSystem(PVector location) {    
    particles = new ArrayList<Particle>();    
    
    origin = location.get();   
  }
  
  void addParticle() {
    
    float r = random(1);
    
    if (r < 0.5) {
      particles.add(new Particle(origin));  
    } else {
      particles.add(new Confetti(origin));
    }
  }
    
  void run() {
    addParticle();
    
    Iterator<Particle> it = particles.iterator();
    
    while(it.hasNext()) {
      Particle p = it.next();
      p.run();
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