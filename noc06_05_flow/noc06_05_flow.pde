

FlowField flowfield;

ArrayList<Vehicle> vehicles;

void setup() {
  size(600,400);
  flowfield = new FlowField(20);
  vehicles = new ArrayList<Vehicle>();
  
  for(int i=0;i<120;i++) {
    vehicles.add(new Vehicle(new PVector(random(width),random(height)),random(2,5),random(0.1,0.5)));
  }
}

void draw() {
  background(255);
  flowfield.display();
  for(Vehicle v:vehicles) {
    v.follow(flowfield);
    v.run();
  }
  
  
}

void mousePressed() {
  flowfield.init();
}