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
      if(i >= trees.size()) i = trees.size()-1;
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
  
  void treeDies(int ind) {
    trees.remove(ind);
  }
  
  void treeDies(Tree t) {
    for(int i = trees.size()-1; i >= 0; i--) {
      Tree t2 = trees.get(i);
      if(t == t2) {
        trees.remove(i);
        break;
      }
    }
  }
  
  void killOldestTree() {
    int record = 0;
    float recordAge = 0;
    for(int i = 0; i < trees.size(); i++) {
      Tree t = trees.get(i);
      if(t.age > recordAge) {
        recordAge = t.age;
        record = i;
      }
    }
    treeDies(record);
  }
  
  float checkOverlap(float mySize, float myHoog, PVector myLoc, int index) {
    float ePercent = 100;
    for(int i = trees.size()-1; i >= 0; i--) {
      Tree t = trees.get(i);
      if(!(myHoog > t.hoogte) && index != i) {
        float totalOpp = (mySize/2)*(mySize/2)*PI;
        float d = myLoc.dist(t.location);
        float radii = mySize/2 + t.size/2;
        float r = mySize/2;
        float R = t.size/2;
        if(d < radii) {
          float A = (r*r*acos((d*d+r*r-R*R)/(2*d*r)))+(R*R*acos((d*d-r*r+R*R)/(2*d*R)))-0.5*(sqrt((-d+r+R)*(d+r-R)*(d-r+R)*(d+r+R)));
          //println(acos((d*d+r*r-R*R)/(2*d*r)),((d*d+r*r-R*R)/(2*d*r)));
          float hMulti;
          if(myHoog == t.hoogte) {
            hMulti = 0.5;
          }
          else {
            hMulti = 1;
          }
          if(!Float.isNaN(A)) {
            float removePercentage = map(A,0,totalOpp,0,ePercent)*hMulti;
            ePercent -= removePercentage;
          }
        }
      }
    }
    return ePercent;
  }
}
