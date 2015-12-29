class FlowField {
  
  PVector[][] field;  
  int cols, rows;  
  int resolution;  
  
  FlowField(int r) {
    resolution = r;
    cols = width/resolution;
    rows = height/resolution;
    
    field = new PVector[cols][rows];
    
    init();
  }
  
  void init() {
    noiseSeed((int)random(10000));
    float xoff= 0;
    for(int i=0;i<cols;i++) {
      float yoff = 0;
      for (int j=0;j<rows;j++) {
        float theta = map(noise(xoff,yoff),0,1,0,TWO_PI);
        field[i][j] = new PVector(cos(theta),sin(theta));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }
  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j],i*resolution,j*resolution,resolution-2);
      }
    }
  }
  
  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    // Translate to location to render vector
    translate(x,y);
    stroke(0,100);
    // Call vector heading function to get direction (note that pointing to the right is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0,0,len,0);
    //line(len,0,len-arrowsize,+arrowsize/2);
    //line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  }
  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x / resolution, 0, cols-1));
    int row = int(constrain(lookup.y/ resolution,0,rows-1));
    return field[column][row].get();
  }
 
}