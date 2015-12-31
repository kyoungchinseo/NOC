
float mutationRate;

int totalPopulation = 150;

DNA[] population;

ArrayList<DNA> matingPool;

String target;

PFont f;

void setup() {
  size(800, 800);
  
  f = createFont("Courier", 32, true);
  
  target = "to be or not to be";
  mutationRate = 0.01;
  
  population = new DNA[totalPopulation];
  
  for(int i=0;i<population.length;i++) {
    population[i] = new DNA();
  }
  
  
}

void draw() {
  background(255);
  textFont(f);
  textAlign(LEFT);
  fill(0);
  
  // fitness
  for(int i=0;i<population.length;i++) {
    population[i].fitness();
  }
    
  ArrayList<DNA> matingPool = new ArrayList<DNA>();
  
  for(int i=0;i<population.length;i++) {
    int n = int(population[i].fitness * 100);
    for (int j=0;j<n;j++) {
      matingPool.add(population[i]);
    }
  }
  
  for(int i=0;i<population.length;i++) {
    int a = int(random(matingPool.size()));
    int b = int(random(matingPool.size()));
    DNA partnerA = matingPool.get(a);
    DNA partnerB = matingPool.get(b);
    
    DNA child = partnerA.crossover(partnerB);
    
    child.mutate(mutationRate);
    
    population[i] = child;    
    
  }

  textSize(15);
  text("All phrases:\n", 20, 20);
  for(int i=0;i<population.length/5;i++) {
    for(int j=0;j<5;j++) {
      text(population[i*5+j].getPhrase(), 20+j*150, 60 + i*20);
    }
  }
   
 
  
}