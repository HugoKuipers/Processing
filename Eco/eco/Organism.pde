class Organism {
  Genome dna;
  float energy;
  
  Organism(Genome myDna) {
    if(myDna.genes.size() == 0) return;
    dna = myDna;
  }
  
  Organism() {
    dna = new Genome();
  }
}
