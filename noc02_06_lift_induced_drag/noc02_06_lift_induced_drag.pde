Mover[] movers = new Mover[10];

Liquid liquid;

void setup() {
  
  size(640,360,P3D);
  
  liquid = new Liquid(0,height/2, width, height/2,0.5);
  
  for(int i=0;i<movers.length;i++) {
    movers[i] = new Mover(random(0.5,5),30+i*(width-30)/movers.length,height/2);
  } 
  
}

void draw() {
  background(255);
  liquid.display();
  
  for(int i=0;i<movers.length;i++) {
    if (movers[i].isInside()) {
      movers[i].drag(liquid);
    } 
    
    float m = 0.1 * movers[i].mass;
    
    PVector flightForce = new PVector(-m,0);
    
    movers[i].applyForce(flightForce);
    
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}