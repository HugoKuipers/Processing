class Tree extends Organism {
  PVector location;
  float size;
  float maxSize;
  float hoogte;
  float myMaxEnergy;
  float energyLvl;
  float growthSpeedSize;
  float growthSpeedHoogte;
  color myColor;
  
  Tree(Genome myDna, PVector spawn) {
    super(myDna);
    myColor = color(map(dna.getGene("color_r",0),0,100,0,255),map(dna.getGene("color_g",0),0,100,0,255),map(dna.getGene("color_b",0),0,100,0,255));
    energyLvl = dna.getGene("energy_lvl",0);
    size = 4;
    maxSize = dna.getGene("max_size",0);
    energy = int((PI*(size/2)*(size/2))*(energyLvl/10));
    myMaxEnergy = int((PI*(size/2)*(size/2))*(energyLvl/10));
    hoogte = 1;
    growthSpeedSize = dna.getGene("growth_speed_size",0);
    growthSpeedHoogte = dna.getGene("growth_speed_hoogte",0);
    location = spawn;
  }
  
  Tree() {
    super();
    dna.add("color_r",0,0);
    dna.add("color_g",95,90);
    dna.add("color_b",0,0);
    dna.add("max_size",15,25);
    dna.add("max_hoogte",15,25);
    dna.add("energy_lvl",10,20);
    dna.add("growth_speed_size",10,20);
    dna.add("growth_speed_hoogte",10,20);
    myColor = color(map(dna.getGene("color_r",0),0,100,0,255),map(dna.getGene("color_g",0),0,100,0,255),map(dna.getGene("color_b",0),0,100,0,255));
    energyLvl = dna.getGene("energy_lvl",0);
    size = 4;
    maxSize = dna.getGene("max_size",0);
    myMaxEnergy = int((PI*(size/2)*(size/2))*(energyLvl/10));
    energy = int((PI*(size/2)*(size/2))*(energyLvl/10));
    hoogte = 1;
    growthSpeedSize = dna.getGene("growth_speed_size",0);
    growthSpeedHoogte = dna.getGene("growth_speed_hoogte",0);
    location = new PVector(int(random(width)),int(random(height)));
  }
  
  void update() {
    energy += energy*0.1;
    energy -= int((PI*(size/2)*(size/2))*((hoogte*hoogte)/1000000));
    grow();
  }
  
  void display() {
    fill(myColor,map(energy,0,myMaxEnergy,0,255));
    ellipse(location.x,location.y,size,size);
  }
  
  void grow() {
    float sizeGrowth;
    float energyLoss;
    if(size < maxSize) {
      sizeGrowth = (maxSize/size)*(energy/myMaxEnergy)*(growthSpeedSize/10)*(1+(energy/1000))*0.1;
      energyLoss = (((size+sizeGrowth)*(size+sizeGrowth)*PI)-(size*size*PI))/1000;
    }
    else {
      sizeGrowth = 0;
      energyLoss = 0;
    }
    
    size += sizeGrowth;
    energy -= energyLoss;
  }
  
  void reproduce() {
    
  }
  
  void die() {
    
  }
}