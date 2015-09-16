import java.util.Iterator; // <<< -- import to use iterator

ArrayList<ParticleSystem> systems;

boolean explosion;

void setup() {
  explosion = false;
  size(640,360);
  systems = new ArrayList<ParticleSystem>();
  
  systems.add(new ParticleSystem(new PVector(100,100), new PVector(20,20), new PVector(100,100)));
  
}

void draw() {
  background(255);
  
  Iterator<ParticleSystem> it = systems.iterator();
  
  while(it.hasNext()) {
    ParticleSystem ps = it.next();
    ps.run(explosion);
    if (ps.isDead()) {
      it.remove();
    }
  }
  
  println(systems.size());
}

void mousePressed() {
  //systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));
  explosion = true;
}