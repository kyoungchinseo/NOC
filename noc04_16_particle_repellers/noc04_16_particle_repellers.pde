import java.util.Iterator; // <<< -- import to use iterator

ArrayList<ParticleSystem> systems;

ArrayList<Repeller> repellers;

boolean explosion;

PVector gravity;

void setup() {  
  size(640,360);
  
  gravity = new PVector(0,0.1);
  
  systems = new ArrayList<ParticleSystem>();
  
  systems.add(new ParticleSystem(new PVector(width/2,50)));
  
  repellers = new ArrayList<Repeller>();
  
  for(int i=0;i<3;i++) {
    repellers.add(new Repeller(width/4*(i+1),height/2));
  }
  
}

void draw() {
  background(175);  
  
  Iterator<ParticleSystem> it = systems.iterator();
  
  while(it.hasNext()) {
    ParticleSystem ps = it.next();    
    ps.applyForce(gravity);
    
    for(Repeller r: repellers) {
      ps.applyRepeller(r);
    }
    
    ps.run();
    if (ps.isDead()) {
      it.remove();
    }
  }
  
  for(Repeller r: repellers) {
    r.display();
  }
  
  println(systems.size());
}

void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX,mouseY))); 
}