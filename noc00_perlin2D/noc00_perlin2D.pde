
float zoff =0.0;
void setup() {
  size(640,640);
  
 
}

void draw() {
  float sx = 0.01;
  float sy = 0.01;
  
  zoff+= 0.005;
  loadPixels();
   
  float xoff = 0.0;  
  for(int x =0;x<width;x++) {
    float yoff = 0.0;    
    for (int y = 0; y<height; y++) {
      //float bright = map(noise(x,y),0,1,0,255);
      noiseDetail(4,0.5);
      float bright = map(noise(xoff,yoff,zoff),0,1,0,255);
      
      pixels[x + y *width] = color(bright);
      yoff += sy;      
    }
    xoff += sx;
  }
  updatePixels();

}