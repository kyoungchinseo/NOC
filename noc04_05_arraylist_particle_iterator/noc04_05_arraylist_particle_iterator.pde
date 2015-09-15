import java.util.Iterator; // <<< -- import to use iterator

ArrayList<Particle> particles;

void setup() {
  size(640,360);
  
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  
  PVector force = new PVector(random(-0.1,0.1),random(0.1,0.1)); 
  
  particles.add(new Particle(new PVector(width/2, 50)));
  

  Iterator<Particle>it = particles.iterator();
  
  while(it.hasNext()){
    Particle p = it.next();
    
    p.run(force,0.05);
 
    if (p.isDead()) {
      it.remove();
    }    
    
  }
 
    
}