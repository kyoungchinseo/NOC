ArrayList movers;

PVector gravity;

void setup() {
  size(640,360);
  
  gravity = new PVector(0.0,0.1);
  
  movers = new ArrayList();
  
  if (movers == null) {
    println("no movers");
  }
}

void draw() {
  background(255);  
    
  for(int i=0;i<movers.size();i++) {
    Mover m = (Mover)movers.get(i); 
    m.applyForce(gravity);
    m.update();
    m.checkEdges();
    m.display();
    
    if (m.outside()) {
      movers.remove(i);
    }
  }
  //print("("+movers.size()+")");  
}

void mouseReleased() {  
  movers.add(new Mover(1.0, 30, height-30));
  PVector bang = new PVector(random(5.0,7.0),random(-6.0,-8.0));
  ((Mover)movers.get(movers.size()-1)).applyForce(bang);
}