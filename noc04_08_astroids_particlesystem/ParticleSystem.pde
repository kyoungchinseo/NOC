class ParticleSystem
{
  ArrayList<Particle> particles;
  
  PVector origin;
  
  ParticleSystem(PVector location) {
    particles = new ArrayList<Particle>();
    origin = location.get();
  }
  
  void addParticle(PVector location) {    
    particles.add(new Particle(location));
  }
  
  void run(PVector location,PVector velocity) {
    addParticle(location);
    
    Iterator<Particle> it = particles.iterator();
    
    while(it.hasNext()) {
      PVector force = new PVector(-velocity.x + random(-0.1,0.1), -velocity.y + random(0.1,0.1)); 
      Particle p = it.next();
      p.run(force,0.01);
      if (p.isDead()) {
        it.remove();
      }
    }    
  }  
}