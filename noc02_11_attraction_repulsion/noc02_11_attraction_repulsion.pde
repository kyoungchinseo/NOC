Mover[] movers = new Mover[20];

Attractor mouseAttractor;

void setup() {
  size(640,360);
  
  for(int i=0;i<movers.length;i++) {
    movers[i]= new Mover(random(0.1,2),random(10,width-10),random(10,height-10));
  }  
  
  mouseAttractor = new Attractor(width/2,height/2);
}

void draw() {
  background(255);  
       
  for(int i=0;i<movers.length;i++) {    
    for(int j=0;j<movers.length;j++) {
      if (i != j) {
        PVector force = movers[j].repel(movers[i]);
        movers[i].applyForce(force);
      }
    }
    PVector force = mouseAttractor.attract(movers[i]);
    movers[i].applyForce(force);
    
    movers[i].update();
    movers[i].display();  
  }  
  
  mouseAttractor.display();
}