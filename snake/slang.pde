class Slang {
  int nextX;
  int nextY;
  int size;
  int dir;
  int nextDir;
  int speed;
  int bodyLength;
  ArrayList<int[]> body = new ArrayList<int[]>();
  color slangColor;
  int score;
  boolean disco;
  boolean picture;
  PImage img;
  boolean cheater;
  
  Slang() {
    score = 0;
    nextX = 408;
    nextY = 408;
    size = 16;
    dir = 2;
    nextDir = 2;
    speed = 0;
    bodyLength = 4;
    body.add(new int[]{408,408});
    body.add(new int[]{392,408});
    body.add(new int[]{376,408});
    body.add(new int[]{360,408});
    slangColor = color(255);
    disco = false;
    picture = false;
    cheater = false;
    img = createImage(800,800,RGB);
    for(int i = 0; i < img.pixels.length; i++) {
      img.pixels[i] = color(30);
    }
    img.updatePixels();
  }
  
  void move() {
    dir = nextDir;
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
    if(picture) updateImg();
    body.add(new int[]{0,0});
    bodyLength++;
    score++;
    if(speed < 70) speed+=2;
    marik.spawnFood();
  }
  
  void cheat() {
    cheater = true;
    body.add(new int[]{0,0});
    bodyLength++;
    if(speed < 70) speed+=2;
  }
  
  void die() {
    restart();
  }
  
  void updateImg() {
    img.loadPixels();
    snakeImg.loadPixels();
    int sight = 100;
    for(int x = 0; x < img.width; x++) {
      for(int y = 0; y < img.height; y++) {
        int loc = x+y*width;
        float d = dist(x,y,marik.foodX,marik.foodY);
        if(d < sight) {
          img.pixels[loc] = snakeImg.pixels[loc];
        }
      }
    }
    img.updatePixels();
  }
}