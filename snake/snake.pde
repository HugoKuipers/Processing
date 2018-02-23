Slang siegfried = new Slang();
int foodX;
int foodY;

void setup() {
  size(800, 800);
  rectMode(CENTER);
}

void draw() {
  delay(100);
  background(20);
  spawnFood();
  siegfried.move();
  siegfried.display();
}

void spawnFood() {
  foodX = ((int) random(50))*16 + 8;
  foodY = ((int) random(50))*16 + 8;
  rect(foodX,foodY,16,16);
}