
Vehicle vehicle;

void setup() {
  size(600,400);
  //vehicle = new Vehicle(random(0,width),random(0,height));
  vehicle = new Vehicle(width/2,height/2);
}

void draw() {
  background(255);
  PVector target = new PVector(mouseX,mouseY);
  //vehicle.seek(target);
  //vehicle.escape(target);
  //vehicle.arrive(target);
  vehicle.wander();
  vehicle.checkBoundary();
  vehicle.update();
  vehicle.display();
  
}