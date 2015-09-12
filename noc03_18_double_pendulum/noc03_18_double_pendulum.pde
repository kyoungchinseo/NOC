DoublePendulum p;

void setup() {
  size(640,360);
  
  p = new DoublePendulum(new PVector(width/2,10),125, 100);
}

void draw() {
  background(255);
  p.go();
}