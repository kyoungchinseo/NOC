import java.util.Random;

Random generator;

void setup() {
  size(640,360);
  generator = new Random();
  background(0);
}

void draw() {
  float numX = (float)generator.nextGaussian();
  float numY = (float)generator.nextGaussian();
  float numC = (float)generator.nextGaussian();
  
  float sdX = 60;
  float sdY = 40;
  float meanX = width/2;
  float meanY = height/2;
  
  float x = sdX * numX + meanX;
  float y = sdY * numY + meanY;
  
  color rgb = color(numC*255,numC*255,numC*255);
  
  noStroke();
  fill(rgb,50);
  ellipse(x,y,32,32);
}