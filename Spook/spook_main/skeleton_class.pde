
class Skeleton {

  boolean keys[] = new boolean[133];

  PVector location;

  float d = 75;
  float r = d/2;

  float moveSpd = 15;

  int HP = 100;

  boolean dead = false;
  int score = 0;
  
  long t = System.currentTimeMillis();
  long end = t+15000;

  //PImage sprite;

  Skeleton() {
    // Constructor for the class
    location = new PVector(width/2, height/2);
    //sprite = loadImage("skeleton.jpg");
  }

  void update() {
    if (keys['w'] || keys[129]) {
      location.y = location.y - moveSpd;
    }
    if (keys['a'] || keys[130]) {
      location.x = location.x - moveSpd;
    }
    if (keys['s'] || keys[131]) {
      location.y = location.y + moveSpd;
    }
    if (keys['d'] || keys[132]) {
      location.x = location.x + moveSpd;
    }
  }

  void checkEdges() {
    //Check if the ball is near the edges
    if (location.x > width - r) {
      location.x = width - r;
    } else if (location.x < 0 + r) {  
      location.x = 0 + r;
    }
    if (location.y > height - r) {
      location.y = height - r;
    } else if (location.y < 0 + r) {   
      location.y = 0 + r;
    }
  }

  void checkCollision() {
    for (int i = 0; i < pumpkins.size(); i++) {
      Pumpkin pump = pumpkins.get(i);
      if (dist(location.x, location.y, pump.location.x, pump.location.y) < r + pump.r) {
        pumpkins.remove(i);
        munch.play();
        score++;
      }
    }
  }

  void displayHUD() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    textAlign(LEFT);
    textSize(32);
    text("Pumpkins eaten: " + score, 25, height - 30);
  }
}
