class Tree extends Organism {
  PVector location;
  int size;
  int hoogte;
  int myMaxEnergy;
  int dnaMaxEnergy;
  color myColor;
  
  Tree(Genome myDna, PVector spawn) {
    super(myDna);
    myColor = color(map(dna.getGene("color_r",0),0,100,0,255),map(dna.getGene("color_g",0),0,100,0,255),map(dna.getGene("color_b",0),0,100,0,255));
    age = 0;
    myMaxEnergy = 10;
    dnaMaxEnergy = dna.getGene("max_energy",0);
    energy = 10;
    size = 4;
    hoogte = 1;
    location = spawn;
  }
  
  Tree() {
    super();
    dna.add("color_r",0,0);
    dna.add("color_g",99,90);
    dna.add("color_b",0,0);
    dna.add("max_size",45,55);
    dna.add("max_hoogte",45,55);
    dna.add("max_energy",30,30);
    myColor = color(map(dna.getGene("color_r",0),0,100,0,255),map(dna.getGene("color_g",0),0,100,0,255),map(dna.getGene("color_b",0),0,100,0,255));
    age = 0;
    myMaxEnergy = 10;
    dnaMaxEnergy = dna.getGene("max_energy",0);
    energy = 10;
    size = 4;
    hoogte = 1;
    location = new PVector(int(random(width)),int(random(height)));
  }
  
  void update() {
    energy += energy*0.01;
    energy -= int((PI*(size/2)) * (hoogte/1000));
    age++;
    grow();
  }
  
  void display() {
    fill(myColor, map(life,0,maxLife,0,255);
    ellipse(location.x,location.y,size,size);
  }
  
  void grow() {
    int sizeGrowth = 0;
    
  }
  
  void reproduce() {
    
  }
  
  void die() {
    
  }
}
