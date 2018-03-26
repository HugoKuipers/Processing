class Tree extends Organism {
  PVector location;
  float size;
  float maxSize;
  float hoogte;
  float myMaxEnergy;
  float leafPercentage;
  float energyLvl;
  float growthSpeedSize;
  float growthSpeedHoogte;
  float seedDist;
  float seedAmount;
  int reproDown;
  int reproCountdown;
  color myColor;
  color borderColor;
  
  void init() {
    myColor = color(map(dna.getGene("color_r",0),0,100,0,255),map(dna.getGene("color_g",0),0,100,0,255),map(dna.getGene("color_b",0),0,100,0,255));
    borderColor = color(dna.getGene("color_r",0)*2,dna.getGene("color_g",0)*2,dna.getGene("color_b",0)*2);
    energyLvl = dna.getGene("energy_lvl",0);
    size = 4;
    maxSize = dna.getGene("max_size",0)*2;
    energy = int((PI*(size/2)*(size/2))*(energyLvl/10));
    myMaxEnergy = (PI*(size/2)*(size/2))*(energyLvl/10)+1;
    leafPercentage = 50;
    hoogte = 1;
    growthSpeedSize = dna.getGene("growth_speed_size",0);
    growthSpeedHoogte = dna.getGene("growth_speed_hoogte",0);
    seedDist = float(dna.getGene("seed_dist",0))/4;
    seedAmount = float(dna.getGene("seed_amount",0))/10;
    reproDown = dna.getGene("reproduction_cooldown",0)*2+1;
    reproCountdown = reproDown;
  }
  
  Tree(Genome myDna, PVector spawn) {
    super(myDna);
    init();
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
    dna.add("poison",0,0);
    dna.add("seed_dist",10,20);
    dna.add("seed_amount",10,12);
    dna.add("reproduction_cooldown",45,55);
    init();
    location = new PVector(int(random(width)),int(random(height)));
  }
  
  void update(int ind) {
    age++;
    photosyntesize(ind);
    grow();
    if(energy <= 0 || Float.isNaN(energy)) die();
    if(reproCountdown == 0) {
      reproCountdown = reproDown;
      reproduce();
      if(energy <= 0) die();
    }
    else {
      reproCountdown -= 1;
    }
  }
  
  void display() {
    stroke(borderColor,map(energy,0,myMaxEnergy,0,255));
    fill(myColor,map(energy,0,myMaxEnergy,0,255));
    ellipse(location.x,location.y,size,size);
  }
  
  void photosyntesize(int ind) {
    float eGain = energy*0.01;
    float eLoss = (PI*(size/2)*(size/2))*((hoogte*hoogte)/100000);
    float ePercentKeep = f.checkOverlap(size,hoogte,location,ind);
    //println(eGain, ePercentKeep);
    eGain *= (ePercentKeep/100);
    //println(energy);
    energy = energy + eGain - eLoss;
    //println(energy);
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
    if(f.trees.size() > 500) {
      for(int i = 0; i < f.trees.size()-500; i++) {
        f.killOldestTree();
      }
    }
    float eLoss = myMaxEnergy/10 + 10*seedAmount*seedAmount;
    println(energy,eLoss,seedAmount);
    if(eLoss < energy) {
      int seedSpawnAmount = int(seedAmount);
      if(random(1) < seedAmount % 1) seedSpawnAmount++;
      for(int i = 0; i < seedSpawnAmount; i++) {
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
  
  void die() {
    f.treeDies(this);
  }
}
