class Food {
  int foodX;
  int foodY;
  int size;
  color foodColor;
  
  Food() {
    foodX = ((int) random(50))*16 + 8;
    foodY = ((int) random(50))*16 + 8;
    size = 16;
    foodColor = color(random(255),random(255),random(255));
  }
  
  void spawnFood() {
    foodX = ((int) random(50))*16 + 8;
    foodY = ((int) random(50))*16 + 8;
    foodColor = color(random(255),random(255),random(255));
  }
    
  void display() {
    fill(foodColor);
    rect(foodX,foodY,size,size);
  }
}