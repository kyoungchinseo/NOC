
Mover[] movers = new Mover[20];

PVector gravity;

void setup() {
  size(640,360);
  
  gravity = new PVector(0.0,0.1);
  
  for(int i=0;i<movers.length;i++) {
    movers[i] = new Mover(random(0.1,2), random(width),random(height));
  }
}

void draw() {
  background(255);
  
  for(int i=0;i<movers.length;i++) {
    
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
  
  
}