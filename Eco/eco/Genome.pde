class Genome {
  ArrayList<Gene> genes;
  
  Genome() {
    genes = new ArrayList<Gene>();
  }
  
  void add(String myName, int myA, int myB) {
    genes.add(new Gene(myName, myA, myB));
  }
  
  Gene getGene(String name) {
    for(int i = 0; i < genes.size(); i++) {
      Gene g = genes.get(i);
      if(g.name == name) {
        return g;
      }
    }
    return new Gene();
  }
  
  int getGene(String name, int ab) {
    for(int i = 0; i < genes.size(); i++) {
      Gene g = genes.get(i);
      if(g.name == name) {
        if(ab == 1) {
          return g.a;
        }
        else if(ab == 2) {
          return g.b;
        }
        else if(ab == 0) {
          int ave = (g.a + g.b) / 2;
          return ave;
        }
      }
    }
    return -1;
  }
}
