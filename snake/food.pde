//class Food {
//  int foodX;
//  int foodY;
  
//  Food() {
//    headX = 408;
//    headY = 408;
//    nextX = 408;
//    nextY = 408;
//    size = 16;
//    dir = 2;
//  }
  
//  void move() {
//    if(dir == 1) {
//      nextY = headY - 16;
//    }
//    else if(dir == 2) {
//      nextX = headX + 16;
//    }
//    else if(dir == 3) {
//      nextY = headY + 16;
//    }
//    else {
//      nextX = headX - 16;
//    }
//    headX = nextX;
//    headY = nextY;
//  }
  
//  void eat() {
//    spawnFood();
//  }
  
//  void display() {
//    rect(headX,headY,size,size);
//  }
  
//}