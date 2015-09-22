class Surface {
  
  ArrayList<Vec2> surface;
  
  Body b;
  
  Surface() {
  
    surface = new ArrayList<Vec2>();
    
    
    float xoff = 0.0;

    for(int i=0;i<width;i=i+10) {
      surface.add(new Vec2(i,map(noise(xoff),0,1,0,height/2) + height/2 + 50));
      xoff += 0.05;
    }   
        
    ChainShape chain = new ChainShape();
    
    Vec2[] vertices = new Vec2[surface.size()];
    
    for(int i=0;i<vertices.length;i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }    
    chain.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain,1);       
    
  }
  
  void display() {
    strokeWeight(1);
    stroke(0);
    noFill();
    
    beginShape();
    for(Vec2 v: surface) {
      vertex(v.x,v.y);
    }
    endShape();
  }    
}