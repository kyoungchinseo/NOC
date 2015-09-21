class Circle {
  
  Body body;
  
  float w;
  float h;
  
  float r;
  
  Circle(float x, float y, float r) {
    this.w = w;
    this.h = h;
    this.r = r;
    
    
    // define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    
    //
    body = box2d.createBody(bd);   
    
    CircleShape cs = new CircleShape();
    float radius = 10;
    cs.m_radius = box2d.scalarPixelsToWorld(radius/2);
        
    
    // fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.1;
    fd.restitution = 0.2;
    
    body.createFixture(fd); 
    
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
     
    pushMatrix();
    translate(pos.x,pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(127);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER); 
    ellipse(0,0,10,10);
    popMatrix();
  }
  
}