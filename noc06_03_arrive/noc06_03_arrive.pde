
Vehicle vehicle;

void setup() {
  size(600,400);
  vehicle = new Vehicle(random(0,width),random(0,height));
}

void draw() {
  background(255);
  PVector target = new PVector(mouseX,mouseY);
  //vehicle.seek(target);
  vehicle.escape(target);
  vehicle.update();
  vehicle.display();
  
}