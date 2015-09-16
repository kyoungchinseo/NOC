// particle system for explosion animation

class ParticleSystem
{
  ArrayList<Particle> particles;
  ArrayList<Confetti> confetti;
  
  PVector origin;
  
   
  ParticleSystem(PVector location) {    
    particles = new ArrayList<Particle>();
    confetti = new ArrayList<Confetti>();
    
    origin = location.get();   
  }
  
  void addParticle() {
    particles.add(new Particle(origin));
    particles.add(new Confetti(origin));
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
    
    Iterator<Confetti> ic = confetti.iterator();
    while(ic.hasNext()) {
      Confetti c = ic.next();
      c.run();
      if (c.isDead()) {
        ic.remove();
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