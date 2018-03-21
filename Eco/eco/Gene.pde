class Gene {
  String name;
  int a;
  int b;
  
  Gene(String myName, int myA, int myB) {
    name = myName;
    a = myA;
    b = myB;
  }
  
  Gene() {
    name = "error";
    a = 0;
    b = 0;
  }
}
