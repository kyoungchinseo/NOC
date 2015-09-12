float gravityMag;
PVector gravityDir;

float slopeAngle;

float slopeH;
float slopeW;

PVector location;
PVector velocity;
PVector acceleration;

float normalForceMag;
PVector normalForceDir;

float frictionMag;
PVector frictionDir;

float x,y;
void setup() {
  size(640, 400);

  gravityMag = 0.4;
  gravityDir = new PVector(0.0,1.0); 

  slopeW = width;
  slopeH = height;

  slopeAngle = atan(slopeH/slopeW);


  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);

  location = new PVector(width*0.75, height-(width*0.75)*tan(slopeAngle));
  x = location.x;
  y = location.y;
  
  normalForceMag = gravityMag * cos(slopeAngle);
  
  normalForceDir = gravityDir.get();
  normalForceDir.rotate(PI/2-slopeAngle);
  
  frictionDir = normalForceDir.get();
 
}

void draw() {
  background(255);

  stroke(0);
  strokeWeight(2);
  fill(175, 50);

  line(0, slopeH, slopeW, 0);

  acceleration.add(frictionDir.mult(normalForceMag*0.1));
  
  velocity.add(acceleration);
  location.add(velocity);

  pushMatrix();
  translate(location.x, location.y);
  rectMode(CENTER);
  rotate(-slopeAngle);
  rect(-15, -15, 30, 30);
  popMatrix();
}