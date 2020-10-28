
class Skeleton {

  boolean keys[] = new boolean[128];

  PVector location;

  float d = 75;
  float r = d/2;

  float moveSpd = 7;

  int HP = 100;

  boolean dead = false;
  int score = 0;
  
  //PImage sprite;

    Skeleton() {
    // Constructor for the class
    location = new PVector(width/2, height/2);
    //sprite = loadImage("skeleton.jpg");
  }

  void update() {

    if (keys['w']) {
      location.y = location.y - moveSpd;
    }
    if (keys['a']) {
      location.x = location.x - moveSpd;
    }
    if (keys['s']) {
      location.y = location.y + moveSpd;
    }
    if (keys['d']) {
      location.x = location.x + moveSpd;
    }
  }

  void checkEdges() {
    //Check if the ball is near the edges
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {  
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {   
      location.y = height;
    }
  }
  
  void checkCollision() {
    for (int i = 0; i < pumpkins.size(); i++) {
      Pumpkin pump = pumpkins.get(i);
      if (dist(location.x, location.y, pump.location.x, pump.location.y) < r + pump.r) {
        pump.dead = true;
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
    
    if (score%25 == 0 && score != 0){
    strokeWeight(1);
    stroke(0);
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(48);
    text(score + " pumpkins!", width/2, height/2);
    }
  }
}
