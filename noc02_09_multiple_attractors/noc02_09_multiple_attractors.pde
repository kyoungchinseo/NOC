Mover[] movers = new Mover[20];

Attractor [] attractors = new Attractor[5];

void setup() {
  size(640,360);
  
  for(int i=0;i<movers.length;i++) {
    movers[i]= new Mover(random(0.1,2),random(10,width-10),random(10,height-10));
  }
  
  for(int i=0;i<attractors.length;i++) {
    attractors[i] = new Attractor(random(50,width-50),random(50,height-50));
  }  
}



void draw() {
  background(255);  
 
  for(int i=0;i<attractors.length;i++) {
    attractors[i].display();  
  }
      
  for(int i=0;i<movers.length;i++) {
    for(int j=0;j<attractors.length;j++) {
      PVector force = attractors[j].attract(movers[i]);
      movers[i].applyForce(force);
      movers[i].update();
      movers[i].display();
    }
  }  
}