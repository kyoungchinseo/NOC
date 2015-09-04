PVector location;
PVector velocity;

int margin;
int radius;
float rotAngle;

void setup() {
  size(600, 600, P3D);

  radius = 5;
  margin = 200;
  
  rotAngle = 0.0;

  location = new PVector(width/2, height/2, height/2);
  velocity = new PVector(2.5, 5, 2.5);

  lights();
}

void draw() {
  
  background(255);  

  location.add(velocity);

  if ((location.x > width-margin-radius) || (location.x < margin+radius)) { 
    velocity.x = velocity.x * (-1);
  }
  if ((location.y > height-margin-radius) || (location.y <margin+radius)) {
    velocity.y = velocity.y * (-1);
  }
  if ((location.z > height-margin-radius) || (location.z <margin+radius)) {
    velocity.z = velocity.z * (-1);
  }
  rotAngle += 0.01;
  
  pushMatrix();

  translate(0, 0, -200);
  
  noFill();
  pushMatrix();  
  translate(width/2, height/2, height/2);
  rotateY(rotAngle);
  box(200, 200, 200);  
  popMatrix();
  
  fill(color(255,0,0));  
  pushMatrix();  
  translate(location.x, location.y, location.z);
  rotateY(rotAngle);
  sphere(radius);  
  popMatrix();



  popMatrix();
}