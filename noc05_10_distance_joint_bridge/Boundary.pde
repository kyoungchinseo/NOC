
class Boundary {
  
 float x;
 float y;
 float r;
  
 Body b;
  
 Boundary(float x_, float y_, float r_) {
   x = x_;
   y = y_;
   r = r_;
   
   PolygonShape sd = new PolygonShape();
   float box2dW = box2d.scalarPixelsToWorld(r/2);
   float box2dH = box2d.scalarPixelsToWorld(r/2);
   
   sd.setAsBox(box2dW,box2dH);
   
   BodyDef bd = new BodyDef();
   bd.type = BodyType.STATIC;
   bd.position.set(box2d.coordPixelsToWorld(x,y));
   b = box2d.createBody(bd);
   
   b.createFixture(sd,1);
   
 }
 
 void display() {
   fill(0);
   stroke(0);
   rectMode(CENTER);
   //rect(x,y,w,h);
   ellipse(x,y,r,r);
 }
  
}