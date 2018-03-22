class Tree extends Organism {
  PVector location;
  float size;
  float maxSize;
  float hoogte;
  float myMaxEnergy;
  float energyLvl;
  float growthSpeedSize;
  float growthSpeedHoogte;
  float seedDist;
  float seedAmount;
  int reproDown;
  int reproCountdown;
  color myColor;
  
  Tree(Genome myDna, PVector spawn) {
    super(myDna); 
    myColor = color(map(dna.getGene("color_r",0),0,100,0,255),map(dna.getGene("color_g",0),0,100,0,255),map(dna.getGene("color_b",0),0,100,0,255));
    energyLvl = dna.getGene("energy_lvl",0);
    size = 4;
    maxSize = dna.getGene("max_size",0);
    energy = int((PI*(size/2)*(size/2))*(energyLvl/10));
    myMaxEnergy = (PI*(size/2)*(size/2))*(energyLvl/10)+1;
    hoogte = 1;
    growthSpeedSize = dna.getGene("growth_speed_size",0);
    growthSpeedHoogte = dna.getGene("growth_speed_hoogte",0);
    location = spawn;
    seedDist = dna.getGene("seed_dist",0)/4;
    seedAmount = dna.getGene("seed_amount",0)/10;
    reproDown = dna.getGene("reproduction_cooldown",0)*1;
    reproCountdown = reproDown;
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
    dna.add("poison",0,0);
    dna.add("seed_dist",10,20);
    dna.add("seed_amount",10,10);
    dna.add("reproduction_cooldown",45,55);
    myColor = color(map(dna.getGene("color_r",0),0,100,0,255),map(dna.getGene("color_g",0),0,100,0,255),map(dna.getGene("color_b",0),0,100,0,255));
    energyLvl = dna.getGene("energy_lvl",0);
    size = 4;
    maxSize = dna.getGene("max_size",0);
    myMaxEnergy = (PI*(size/2)*(size/2))*(energyLvl/10)+1;
    energy = int((PI*(size/2)*(size/2))*(energyLvl/10));
    hoogte = 1;
    growthSpeedSize = dna.getGene("growth_speed_size",0);
    growthSpeedHoogte = dna.getGene("growth_speed_hoogte",0);
    location = new PVector(int(random(width)),int(random(height)));
    seedDist = dna.getGene("seed_dist",0)/4;
    seedAmount = dna.getGene("seed_amount",0)/10;
    reproDown = dna.getGene("reproduction_cooldown",0)*1;
    reproCountdown = reproDown;
  }
  
  void update(int ind) {
    photosyntesize(ind);
    grow();
    if(energy <= 0 || Float.isNaN(energy)) die(ind);
    if(reproCountdown == 0) {
      reproCountdown = reproDown;
      reproduce();
      if(energy <= 0) die(ind);
    }
    else {
      reproCountdown -= 1;
    }
  }
  
  void display() {
    //stroke(myColor,map(energy,0,myMaxEnergy,0,255));
    fill(myColor,map(energy,0,myMaxEnergy,0,255));
    ellipse(location.x,location.y,size,size);
  }
  
  void photosyntesize(int ind) {
    float eGain = energy*0.1;
    float eLoss = (PI*(size/2)*(size/2))*((hoogte*hoogte)/1000000);
    float ePercentKeep = f.checkOverlap(size,hoogte,location,ind);
    eLoss *= (100/ePercentKeep);
    energy += eGain - eLoss;
    if(energy > myMaxEnergy) energy = myMaxEnergy;
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
    float eLoss = myMaxEnergy/10 + 10*seedAmount*seedAmount;
    if(eLoss < energy) {
      for(int i = 0; i < int(seedAmount); i++) {
        PVector childSpawn = PVector.random2D();
        childSpawn.normalize();
        float spawnMag = random((seedDist*seedDist)+size);
        childSpawn.mult(spawnMag);
        childSpawn.add(location);
        if(!(childSpawn.x < -200 || childSpawn.x > width+200 || childSpawn.y < -200 || childSpawn.y > height+200)) {
          f.add(repro.reproduce(dna,dna),childSpawn);
        }
      }
    }
    energy -= eLoss;
  }
  
  void die(int ind) {
    f.trees.remove(ind);
  }
}
