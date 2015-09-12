// http://scienceworld.wolfram.com/physics/DoublePendulum.html


class DoublePendulum {
  PVector location1;
  PVector origin1;
  
  PVector location2;
  PVector origin2;
  
  float r1;  
  float angle1;
  float aVelocity1;
  float aAcceleration1;
  float damping1;
  
  float r2;
  float angle2;
  float aVelocity2;
  float aAcceleration2;
  float damping2;
  
  
  DoublePendulum(PVector origin_, float r1_, float r2_) {
    r1 = r1_;
    origin1 = origin_.get();
    location1 = new PVector();        
    angle1 = PI/4;
    
    aVelocity1 =0.0;
    aAcceleration1 = 0.0;
    
    damping1 = 0.995;
    //damping = 1.0;
    
    r2 = r2_;
    origin2 = new PVector(origin1.x,origin1.y+r2);
    location2 = new PVector();
        
    angle2 = PI/2;
    
    aVelocity2 =0.0;
    aAcceleration2 = 0.0;
    
    damping2 = 0.995;
    
  }
  
  void go() {
    update();
    display();
  }
  
  void update() {
    float gravity = 0.4;
    
    aAcceleration1 = (-1 * gravity / r1) * sin(angle1);
    
    aVelocity1 += aAcceleration1;
    angle1 += aVelocity1;
    
    aVelocity2 *= damping1;
    
    aAcceleration2 = (-1 * gravity / r2) * sin(angle2);
    
    aVelocity2 += aAcceleration2;
    angle2 += aVelocity2;
    
    aVelocity2 *= damping2;
  }
  
  void display() {
    location1.set(r1 * sin(angle1), r1 * cos(angle1),0);
    location1.add(origin1);
    
    location2.set((r1 * sin(angle1) + r2*(angle2)), (r1*cos(angle1)+r2*cos(angle2)));
    location2.add(origin1.x,origin1.y);
    
    stroke(0);
    
    line(origin1.x, origin1.y, location1.x, location1.y);
    
    fill(175);
    
    ellipse(location1.x,location1.y, 16,16);
    
    line(location1.x,location1.y,location2.x, location2.y);
    ellipse(location2.x,location2.y,16,16);
    
    
  }
  
}