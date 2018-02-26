Slang cornelius = new Slang();
Food marik = new Food();
int highScore = 0;
PImage snakeImg;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  snakeImg = loadImage("data/snake.jpg");
  snakeImg.resize(800,800);
}

void draw() {
  delay(80-cornelius.speed);
  if(cornelius.picture) {
    background(cornelius.img);
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
    cornelius.picture = !cornelius.picture;
  }
  else if(key == 'c') {
    cornelius.cheat();
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
  cornelius = new Slang();
  marik = new Food();
}