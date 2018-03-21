class Reproductor {
  int mutaCha;
  int mutaRate;
  
  Reproductor(int mutCha, int mutRa) {
    mutaCha = mutCha;
    mutaRate = mutRa;
  }
  
  Reproductor() {
    mutaCha = 1;
    mutaRate = 10;
  }
  
  Genome reproduce(Genome m, Genome f) {
    Genome child = new Genome();
    for(int i = 0; i < m.genes.size(); i++) {
      Gene mi = m.genes.get(i);
      Gene fi = f.genes.get(i);
      String cName = mi.name;
      int mia = mi.a;
      int mib = mi.b;
      int fia = fi.a;
      int fib = fi.b;
      int cia;
      int cib;
      if(random(2) < 1) {
        cia = mia;
      }
      else {
        cia = fia;
      }
      if(random(100) < mutaCha) {
        int myMut = int(random(-mutaRate, mutaRate));
        cia += myMut;
        if(cia > 100) cia = 100;
        if(cia < 0) cia = 0;
      }
      if(random(2) < 1) {
        cib = mib;
      }
      else {
        cib = fib;
      }
      if(random(100) < mutaCha) {
        int myMut = int(random(-mutaRate, mutaRate));
        cib += myMut;
        if(cib > 100) cib = 100;
        if(cib < 0) cib = 0;
      }
      child.add(cName, cia, cib);
    }
    return child;
  }
  
  Genome reproduce(Genome m, Genome f, int mCha, int mRate) {
    Genome child = new Genome();
    for(int i = 0; i < m.genes.size(); i++) {
      Gene mi = m.genes.get(i);
      Gene fi = f.genes.get(i);
      String cName = mi.name;
      int mia = mi.a;
      int mib = mi.b;
      int fia = fi.a;
      int fib = fi.b;
      int cia;
      int cib;
      if(random(2) < 1) {
        cia = mia;
      }
      else {
        cia = fia;
      }
      if(random(100) < mCha) {
        int myMut = int(random(-mRate, mRate));
        cia += myMut;
        if(cia > 100) cia = 100;
        if(cia < 0) cia = 0;
      }
      if(random(2) < 1) {
        cib = mib;
      }
      else {
        cib = fib;
      }
      if(random(100) < mCha) {
        int myMut = int(random(-mRate, mRate));
        cib += myMut;
        if(cib > 100) cib = 100;
        if(cib < 0) cib = 0;
      }
      child.add(cName, cia, cib);
    }
    return child;
  }
}
