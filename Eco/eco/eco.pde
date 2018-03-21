Reproductor repro = new Reproductor();
Tree t;

void setup() {
  size(1200,800);
  t = new Tree();
}

void draw() {
  background(220,240,230);
  t.update();
  t.display();
}
