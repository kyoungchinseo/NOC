// particle system for explosion animation

class ParticleSystem
{
  ArrayList<Particle> particles;
  
  PVector origin;
  PVector numParticles;
  PVector sizeObj;
  
   
  ParticleSystem(PVector location, PVector num, PVector size) {    
    particles = new ArrayList<Particle>();
    origin = location.get();    
    numParticles = num.get();
    sizeObj = size.get();
    
    for(int i=0;i<numParticles.y;i++) {
      for(int j=0;j<numParticles.x;j++) {
        PVector loc = new PVector(origin.x + size.x/numParticles.x*i, origin.y+ size.y/numParticles.y*j);
        particles.add(new Particle(loc));
      }
    }
    
  }
  
  void run(boolean explorsion) {
    
    Iterator<Particle> it = particles.iterator();
    
    while(it.hasNext()) {      
      PVector force;
      if (explorsion == true) {
        force = new PVector(random(-0.5,0.5),random(-0.5,0.5));
      } else {
        force = new PVector(0.0,0.0);
      }
      Particle p = it.next();
      p.run(explosion,force,0.0);
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