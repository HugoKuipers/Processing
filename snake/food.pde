class Food {
  int foodX;
  int foodY;
  int size;
  color foodColor;
  
  Food() {
    foodX = ((int) random(50))*16 + 8;
    foodY = ((int) random(50))*16 + 8;
    for(int i = 0; i < cornelius.bodyLength; i++) {
      if(cornelius.body.get(i)[0] == foodX && cornelius.body.get(i)[1] == foodY) {
        spawnFood();
      }
    }
    if(cornelius.nextX == foodX && cornelius.nextY == foodY) {
      spawnFood();
    }
    size = 16;
    foodColor = color(random(255),random(255),random(255));
  }
  
  void spawnFood() {
    foodX = ((int) random(50))*16 + 8;
    foodY = ((int) random(50))*16 + 8;
    for(int i = 0; i < cornelius.bodyLength; i++) {
      if(cornelius.body.get(i)[0] == foodX && cornelius.body.get(i)[1] == foodY) {
        spawnFood();
      }
    }
    if(cornelius.nextX == foodX && cornelius.nextY == foodY) {
      spawnFood();
    }
    foodColor = color(random(255),random(255),random(255));
  }
    
  void display() {
    fill(foodColor);
    rect(foodX,foodY,size,size);
  }
}