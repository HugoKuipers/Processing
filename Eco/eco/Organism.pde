class Organism {
  Genome dna;
  float energy;
  float age;
  
  Organism(Genome myDna) {
    if(myDna.genes.size() == 0) return;
    dna = myDna;
    age = 0;
  }
  
  Organism() {
    dna = new Genome();
    age = 0;
  }
}
