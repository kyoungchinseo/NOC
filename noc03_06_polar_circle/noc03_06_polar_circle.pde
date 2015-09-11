float r = 75;
float theta = 0;

color c = color(0,0,0);

void setup() {
  size(640,640);
  background(255);
}

void draw() {
  
  for(int i = 30; i<640; i+=32) {
    r = i;  
    float x = r * cos(theta*PI/180);
    float y = r * sin(theta*PI/180);
  
    noStroke();
    
    fill(c);
    ellipse(x + width/2, y + height/2, 16,16);
  }
  
  theta += 1.0;
  
  if (theta > 360) {
    theta = 0;
    c = color(random(0,255),random(0,255),random(0,255));
  }
  
}