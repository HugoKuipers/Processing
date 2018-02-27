import java.io.File;
Slang cornelius;
Food marik;
int highScore = 0;
int screenSize = 800;
boolean picture;
boolean nsfw;
PImage[] snakeImgs;
PImage[] nsfwImgs;

void setup() {
  java.io.File folder = new java.io.File(dataPath("/snakes"));
  String[] filenames = folder.list();
  snakeImgs = new PImage[filenames.length];
  for(int i = 0; i < snakeImgs.length; i++) {
    snakeImgs[i] = loadImage("/snakes/"+filenames[i]);
    snakeImgs[i].resize(800,800);
  }
  folder = new java.io.File(dataPath("/nsfw"));
  filenames = folder.list();
  nsfwImgs = new PImage[filenames.length];
  for(int i = 0; i < nsfwImgs.length; i++) {
    nsfwImgs[i] = loadImage("/nsfw/"+filenames[i]);
    nsfwImgs[i].resize(screenSize,screenSize);
  }
  size(800, 800);
  rectMode(CENTER);
  picture = true;
  nsfw = false;
  cornelius = new Slang(snakeImgs[int(random(snakeImgs.length))]);
  marik = new Food();
}

void draw() {
  if(cornelius.zaklamp) {
    delay(40-cornelius.speed);
  }
  else {
    delay(80-cornelius.speed);
  }
  if(picture) {
    if(cornelius.zaklamp) {
      cornelius.lampZak();
    }
    background(cornelius.viewImg);
  }
  else {
    background(30);
  }
  cornelius.move();
  marik.display();
  cornelius.display();
}

void keyPressed() {
  if(keyCode == UP && cornelius.dir != 3) {
    cornelius.nextDir = 1;
  }
  else if(keyCode == RIGHT && cornelius.dir != 4) {
    cornelius.nextDir = 2;
  }
  else if(keyCode == DOWN && cornelius.dir != 1) {
    cornelius.nextDir = 3;
  }
  else if(keyCode == LEFT && cornelius.dir != 2) {
    cornelius.nextDir = 4;
  }
  else if(key == 'd') {
    cornelius.disco = !cornelius.disco;
  }
  else if(key == 'p') {
    picture = !picture;
  }
  else if(key == 'c') {
    cornelius.cheat();
  }
  else if(key == 'z' && cornelius.speed < 40) {
    cornelius.zaklamp = !cornelius.zaklamp;
    if(!cornelius.zaklamp) cornelius.lampOff();
  }
  else if(key == 'r') {
    nsfw = !nsfw;
  }
}

void restart() {
  if(cornelius.score > highScore) highScore = cornelius.score;
  if(!cornelius.cheater) {
    println("Score: "+cornelius.score+" -- Highscore: "+highScore);
  }
  else {
    println("Who cares about your score, you dirty cheater");
  }
  if(nsfw) {
    cornelius = new Slang(nsfwImgs[int(random(nsfwImgs.length))]);
  }
  else {
    cornelius = new Slang(snakeImgs[int(random(snakeImgs.length))]);
  }
  marik = new Food();
}