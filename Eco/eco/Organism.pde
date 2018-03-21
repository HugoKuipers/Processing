class Organism {
  Genome dna;
  int energy;
  
  Organism(Genome myDna) {
    dna = myDna;
  }
  
  Organism() {
    dna = new Genome();
  }
}