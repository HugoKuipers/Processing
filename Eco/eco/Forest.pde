class Forest {
  ArrayList<Tree> trees;
  
  Forest() {
    trees = new ArrayList<Tree>();
  }
  
  Forest(int startNum) {
    trees = new ArrayList<Tree>();
    for(int i = 0; i < startNum; i++) {
      trees.add(new Tree());
    }
  }
  
  void update() {
    for(int i = trees.size()-1; i >= 0; i--) {
      Tree t = trees.get(i);
      t.update(i);
    }
    //println(trees.size());
  }
  
  void display() {
    for(int i = trees.size()-1; i >= 0; i--) {
      Tree t = trees.get(i);
      t.display();
    }
  }
  
  void add(Genome myDna, PVector spawn) {
    trees.add(new Tree(myDna, spawn));
  }
  
  void treeDies() {
    //
  }
  
  float checkOverlap(float mySize, float myHoog, PVector myLoc, int index) {
    float ePercent = 100;
    float totalOpp = (mySize/2)*(mySize/2)*PI;
    for(int i = trees.size()-1; i >= 0; i--) {
      Tree t = trees.get(i);
      if(!(myHoog > t.hoogte) && index != i) {
        float d = myLoc.dist(t.location);
        float radii = mySize/2 + t.size/2;
        float r = mySize/2;
        float R = t.size/2;
        if(d < radii) {
          float A = (r*r*acos((d*d+r*r-R*R)/(2*d*r)))+(R*R*acos((d*d-r*r+R*R)/(2*d*R)))-0.5*(sqrt((-d+r+R)*(d+r-R)*(d-r+R)*(d+r+R)));
          println(A);
          float hMulti;
          if(myHoog == t.hoogte) {
            hMulti = 0.5;
          }
          else {
            hMulti = 1;
          }
          float removePercentage = map(A,0,totalOpp,0,ePercent)*hMulti;
          ePercent -= removePercentage;
          println(ePercent);
        }
      }
    }
    return ePercent;
  }
}
