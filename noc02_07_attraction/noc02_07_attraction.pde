Mover m ;

Attractor a;

void setup() {
  size(640,360);
  m = new Mover(10,random(10,width-10),random(10,height-10));
  
  a = new Attractor();
  
  
}



void draw() {
  background(255);
 
  PVector force = a.attract(m);
  m.applyForce(force);
  m.update();
  
  a.display();  
  m.display();  
  
}