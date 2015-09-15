import java.util.Iterator; // <<< -- import to use iterator

ArrayList<ParticleSystem> systems;


void setup() {
  size(640,360);
  systems = new ArrayList<ParticleSystem>(); 
}

void draw() {
  background(255);
  
  for(ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
  }
}

void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));
}