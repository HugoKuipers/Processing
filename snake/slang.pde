class Slang {
  int nextX;
  int nextY;
  int size;
  int dir;
  int speed;
  int bodyLength;
  ArrayList<int[]> body = new ArrayList<int[]>();
  color slangColor;
  int score;
  boolean disco;
  
  Slang() {
    score = 0;
    nextX = 408;
    nextY = 408;
    size = 16;
    dir = 2;
    speed = 0;
    bodyLength = 4;
    body.add(new int[]{408,408});
    body.add(new int[]{392,408});
    body.add(new int[]{376,408});
    body.add(new int[]{360,408});
    slangColor = color(255);
    disco = false;
  }
  
  void move() {
    if(dir == 1) {
      nextY = body.get(0)[1] - 16;
    }
    else if(dir == 2) {
      nextX = body.get(0)[0] + 16;
    }
    else if(dir == 3) {
      nextY = body.get(0)[1] + 16;
    }
    else {
      nextX = body.get(0)[0] - 16;
    }
    checkPos();
    
    for(int i = bodyLength-1; i > 0; i--) {
      int[] val = new int[]{body.get(i-1)[0],body.get(i-1)[1]};
      body.set(i, val);
    }
    int[] val = new int[]{nextX,nextY};
    body.set(0, val);
  }
  
  void checkPos() {
    if(nextX < 8 || nextX > 792 || nextY < 8 || nextY > 792) {
      die();
    }
    else if(nextX == marik.foodX && nextY == marik.foodY) {
      eat();
    }
    for(int i = 0; i < bodyLength; i++) {
      if(body.get(i)[0] == nextX && body.get(i)[1] == nextY) {
        die();
      }
    }
  }
  
  void display() {
    fill(slangColor);
    for(int i = 0; i < bodyLength; i++) {
      if(disco) fill(random(255),random(255),random(255));
      rect(body.get(i)[0],body.get(i)[1],size,size);
    }
  }
  
  void eat() {
    body.add(new int[]{0,0});
    bodyLength++;
    score++;
    if(speed < 70) speed+=2;
    marik.spawnFood();
  }
  
  void die() {
    restart();
  }
}