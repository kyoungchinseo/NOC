class Wave {
  
  
  float startAngle;  
  float angleVelocity;
  
  float amplitude;
  
  PVector startLocation;
  PVector endLocation;
    
  Wave() {
    amplitude = random(height/20,height/6);
    startAngle = random(-2.0,2.0);
    angleVelocity = random(0.1,0.3);
    startLocation = new PVector(random(10,width/2-10),random(10,height-10));
    endLocation = new PVector(startLocation.x + random(200,width/2),startLocation.y);
    
    
  }
  
  void oscillate() {
    startAngle += angleVelocity;  
  }
  
  void display() {
    float angle = startAngle;
    int startPos = (int)startLocation.x;
    int endPos = (int)endLocation.x;
    
    for(int x= startPos; x<= endPos ; x+=5) {
      float y = map(sin(angle),-1,1,-amplitude,amplitude);
      stroke(0);
      fill(0,50);
      ellipse(x,y+startLocation.y,24,24);
      angle += angleVelocity;
    }  
  }
  
  
  
  
}