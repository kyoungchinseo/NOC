

ArrayList<Vehicle> vehicles;

void setup() {
  size(640,360);
  vehicles = new ArrayList<Vehicle>();
  
  for(int i=0;i<100;i++) {
    vehicles.add(new Vehicle(random(width),random(height)));
  }
  
}

void draw() {
  background(255);
  
  for (Vehicle v: vehicles) {
    //v.separate(vehicles);
    v.applyBehaviors(vehicles);
    v.update();
    v.display();
    v.borders();
  
  }
}