class Organism {
  Genome dna;
  int age;
  int energy;
  
  Organism(Genome myDna) {
    dna = myDna;
  }
  
  Organism() {
    dna = new Genome();
  }
}
