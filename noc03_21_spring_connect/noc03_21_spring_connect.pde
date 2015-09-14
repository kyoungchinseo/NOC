Ball ball;

Spring spring;

void setup() {  
  size(640,640);
  
  ball = new Ball(width/2, 300);  
  spring = new Spring(width/2,0,200);
}

void draw() {
  
  background(255);
  
  
  PVector gravity = new PVector(0,0.1);  
  ball.applyForce(gravity);    
  spring.connect(ball);
    
  ball.update();  
  spring.displayLine(ball);
  ball.display();  
  spring.display();
  
}