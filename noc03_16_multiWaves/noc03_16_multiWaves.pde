Wave [] waves = new Wave[5];



void setup() {
  
  size(640,400);

  for(int i=0;i<waves.length;i++) {
    waves[i] = new Wave();
  }
  
}

void draw() {
  background(255);
 
  for(int i=0;i<waves.length;i++) {
    waves[i].oscillate();
    waves[i].display();
  }
 
}