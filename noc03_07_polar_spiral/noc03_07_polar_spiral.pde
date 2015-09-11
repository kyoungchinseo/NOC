float r = 5;
float theta = 0;

color c = color(0,0,0);

void setup() {
  size(640,640);
  background(255);
}

void draw() {
  r = theta/10;
  //r = pow(theta/50,2);
    
  float x = r * cos(theta*PI/180);
  float y = r * sin(theta*PI/180);

  noStroke();
  
  fill(c);
  ellipse(x + width/2, y + height/2, 16,16);
  
  theta += 1; 
}