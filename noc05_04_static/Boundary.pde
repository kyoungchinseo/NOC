class Boundary {
  
  float x,y;
  float w,h;
  
  Body b;
  
  Boundary(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    
    BodyDef bd = new BodyDef();
    
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    
    // STATIC type for fixed object
    bd.type = BodyType.STATIC;  
    
    b = box2d.createBody(bd);
    
    float boxW = box2d.scalarPixelsToWorld(w/2);
    float boxH = box2d.scalarPixelsToWorld(h/2);
    
    PolygonShape ps = new PolygonShape();
    
    ps.setAsBox(boxW,boxH);
    
    b.createFixture(ps,1);   
    
  }
  
  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }  
  
}