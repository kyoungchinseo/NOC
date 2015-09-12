void setup() {
  size(640,360);
}

void draw() {
  background(255);
  
  float period = 120;
  float amplitude = 100;
  
  float y = amplitude * sin(TWO_PI * frameCount / period);
  
  stroke(0);
  fill(175);
  translate(width/2, height/2);
  line(0,0,0,y);
  ellipse(0,y,20,20);
}