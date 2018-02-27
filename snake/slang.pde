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
  boolean zaklamp;
  PImage img;
  PImage viewImg;
  PImage selectedImg;
  boolean cheater;
  
  Slang(PImage tempImg) {
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
    zaklamp = false;
    cheater = false;
    selectedImg = tempImg;
    img = createImage(800,800,RGB);
    for(int i = 0; i < img.pixels.length; i++) {
      img.pixels[i] = color(30);
    }
    img.updatePixels();
    viewImg =  createImage(800,800,RGB);
    for(int i = 0; i < viewImg.pixels.length; i++) {
      viewImg.pixels[i] = color(30);
    }
    viewImg.updatePixels();
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
    if(speed == 40) zaklamp = false;
    marik.spawnFood();
  }
  
  void cheat() {
    cheater = true;
    body.add(new int[]{0,0});
    bodyLength++;
    if(speed < 70) speed+=2;
    if(speed == 40) zaklamp = false;
  }
  
  void die() {
    restart();
  }
  
  void updateImg() {
    img.loadPixels();
    selectedImg.loadPixels();
    int sight = 100;
    for(int x = 0; x < img.width; x++) {
      for(int y = 0; y < img.height; y++) {
        int loc = x+y*width;
        float d = dist(x,y,marik.foodX,marik.foodY);
        if(d < sight) {
          img.pixels[loc] = selectedImg.pixels[loc];
        }
      }
    }
    img.updatePixels();
    viewImg.loadPixels();
    for(int i = 0; i < img.pixels.length; i++) {
      viewImg.pixels[i] = img.pixels[i];
    }
    viewImg.updatePixels();
  }
  
  void lampZak() {
    img.loadPixels();
    selectedImg.loadPixels();
    int lampSight = 80;
    for(int x = 0; x < img.width; x++) {
      for(int y = 0; y < img.height; y++) {
        int loc = x+y*width;
        float d = dist(x,y,nextX,nextY);
        float r = red(selectedImg.pixels[loc]);
        float g = green(selectedImg.pixels[loc]);
        float b = blue(selectedImg.pixels[loc]);
        float factor = map(d,0,lampSight,3/2,1/2);
        float rFactor = map(r*factor,0,255,30,300);
        float gFactor = map(g*factor,0,255,30,300);
        float bFactor = map(b*factor,0,255,30,300);
        float imgTotal;
        if(color(img.pixels[loc]) == color(30,30,30)) {
          imgTotal = 0;
        }
        else {
          imgTotal = red(img.pixels[loc])+green(img.pixels[loc])+blue(img.pixels[loc]);
        }
        float lampTotal = r+g+b;
        if(d < lampSight && lampTotal > imgTotal) {
          viewImg.pixels[loc] = color(rFactor,gFactor,bFactor);
        }
        else {
          viewImg.pixels[loc] = img.pixels[loc];
        }
      }
    }
    viewImg.updatePixels();
  }
  
  void lampOff() {
    img.loadPixels();
    viewImg.loadPixels();
    for(int i = 0; i < img.pixels.length; i++) {
      viewImg.pixels[i] = img.pixels[i];
    }
    viewImg.updatePixels();
  }
}