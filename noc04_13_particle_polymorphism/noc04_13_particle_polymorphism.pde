import java.util.Iterator; // <<< -- import to use iterator

ArrayList<ParticleSystem> systems;

boolean explosion;

void setup() {  
  size(640,360);
  systems = new ArrayList<ParticleSystem>();
  
  systems.add(new ParticleSystem(new PVector(width/2,50)));
  
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
  //explosion = true;
}