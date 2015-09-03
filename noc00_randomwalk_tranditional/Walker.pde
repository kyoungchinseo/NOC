class Walker {
  int x;
  int y;
  
  Walker() {
    x = width / 2;
    y = height/ 2;    
  }
  
  void step() {
    /*
    int choice = int(random(4));
    switch(choice) {
     case 0:
      x++;
      break;
     case 1:
      x--;
      break;
     case 2:
      y++;
      break;
     case 3:
       y--;
       break;
    } 
    */
    //float stepx = random(-2,2);
    //float stepy = random(-2,2);
    
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    
    x += stepx;
    y += stepy;
  }
  
  void display() {
    stroke(0);
    point(x,y);
  }
}