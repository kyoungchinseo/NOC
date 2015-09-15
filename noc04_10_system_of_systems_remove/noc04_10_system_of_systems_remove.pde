import java.util.Iterator; // <<< -- import to use iterator

ArrayList<ParticleSystem> systems;


void setup() {
  size(640,360);
  systems = new ArrayList<ParticleSystem>(); 
}

void draw() {
  background(255);
  
  Iterator<ParticleSystem> it = systems.iterator();
  
  while(it.hasNext()) {
    ParticleSystem ps = it.next();
    ps.run();
    if (ps.isDead()) {
      it.remove();
    }
  }
  
  println(systems.size());
}

void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));
}