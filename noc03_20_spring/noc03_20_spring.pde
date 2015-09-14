Ball ball;

void setup() {
  
  size(640,640);
  ball = new Ball(width/2,0, width/2, 300);
}

void draw() {
  PVector gravity = new PVector(0,0.1);
  ball.applyForce(gravity);  
  
  ball.applySpringForce();
  
  
  ball.update();
  ball.display();
  
}