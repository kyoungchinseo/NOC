class Liquid {
  float x, y, w, h;
  float c;
  
  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
  
  void display() {    
    stroke(1);
    fill(100);
    pushMatrix();
    translate(w/2,h*1.6,0);
    box(w,h,h);    
    popMatrix();
  }
}