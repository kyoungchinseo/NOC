class ParticleSystem
{
  ArrayList<Particle> particles;
  
  PVector origin;
  
  ParticleSystem(PVector location) {
    particles = new ArrayList<Particle>();
    origin = location.get();
  }
  
  void addParticle() {    
    particles.add(new Particle(origin));
  }
  
  void run() {
    addParticle();
    
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
}