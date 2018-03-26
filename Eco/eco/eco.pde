Reproductor repro = new Reproductor(1,10);
Forest f;

void setup() {
  size(1200,800);
  frameRate(60);
  //frameRate(30);
  //frameRate(10);
  //frameRate(5);
  //frameRate(1);
  f = new Forest(10);
}

void draw() {
  background(220,240,230);
  f.update();
  f.display();
}
