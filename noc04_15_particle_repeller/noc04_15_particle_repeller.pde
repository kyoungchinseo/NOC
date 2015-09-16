import java.util.Iterator; // <<< -- import to use iterator

ArrayList<ParticleSystem> systems;

Repeller repeller;

boolean explosion;

PVector gravity;

void setup() {  
  size(640,360);
  
  gravity = new PVector(0,0.1);
  
  systems = new ArrayList<ParticleSystem>();
  
  systems.add(new ParticleSystem(new PVector(width/2,50)));
 
  repeller = new Repeller(width/2-20,height/2);
}

void draw() {
  background(175);  
  
  Iterator<ParticleSystem> it = systems.iterator();
  
  while(it.hasNext()) {
    ParticleSystem ps = it.next();    
    ps.applyForce(gravity);
    
    ps.applyRepeller(repeller);
    
    ps.run();
    if (ps.isDead()) {
      it.remove();
    }
  }
  
  repeller.display();
  
  println(systems.size());
}

void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));
  //explosion = true;
}