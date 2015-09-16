class Confetti extends Particle {
  
  PImage image;
  
  Confetti(PVector l) {
    super(l); 
    image = loadImage("particle.png");
  }
  
  void display() {
    float theta = map(location.x, 0, width, 0 ,TWO_PI);
    
    imageMode(CENTER);
    tint(255,lifespan);
    
    image(img,location.x, location.y, 16,16);
    
  }
}