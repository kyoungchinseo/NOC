class Box {
  
  Body body;
  
  float w;
  float h;
  
  Box(float x, float y, float w, float h) {
    this.w = w;
    this.h = h;
    
    
    // define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    
    //
    body = box2d.createBody(bd);   
    
    // shape 
    PolygonShape ps = new PolygonShape();
    float boxW = box2d.scalarPixelsToWorld(w/2);
    float boxH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(boxW,boxH);
    
    // fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
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
    rect(0,0,w,h);
    popMatrix();
  }
  
}