Slang cornelius = new Slang();
Food marik = new Food();
int highScore = 0;

void setup() {
  size(800, 800);
  rectMode(CENTER);
}

void draw() {
  delay(80-cornelius.speed);
  background(30);
  cornelius.move();
  marik.display();
  cornelius.display();
}

void keyPressed() {
  if(keyCode == UP && cornelius.dir != 3) {
    cornelius.dir = 1;
  }
  else if(keyCode == RIGHT && cornelius.dir != 4) {
    cornelius.dir = 2;
  }
  else if(keyCode == DOWN && cornelius.dir != 1) {
    cornelius.dir = 3;
  }
  else if(keyCode == LEFT && cornelius.dir != 2) {
    cornelius.dir = 4;
  }
  else if(key == 'd') {
    cornelius.disco = !cornelius.disco;
  }
}

void restart() {
  if(cornelius.score > highScore) highScore = cornelius.score;
  println("Score: "+cornelius.score+" -- Highscore: "+highScore);
  cornelius = new Slang();
  marik = new Food();
}