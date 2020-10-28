import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class spook_main extends PApplet {

  
  //---------- Import the sound library to play sound -----//
  
  
  //---------- Variables needed for sound ----------//
  SoundFile soundtrack;
  SoundFile munch;
  String path1 = "data\\spook.mp3";
  String path2 = "data\\munch.mp3";
  boolean soundStarted = false;
  
  //---------- Variables needed for character sprites ----------//
  PImage skeletonSprite;
  PImage pumpkinSprite;
  PImage background;
  
  //---------- Variables needed for characters ----------//
  ArrayList<Pumpkin> pumpkins = new ArrayList<Pumpkin>();
  Skeleton player = new Skeleton();
  MenuElements menu = new MenuElements();
  
  //---------- Variables needed for the main game ----------//
  int initialPumpkins = PApplet.parseInt(random(8, 10));
  int minimumPumpkins = 10;
  int amountToSpawn = PApplet.parseInt(random(1, 5));
  
  //---------- Variables needed for the main game ----------//
  int gameWidth = 1280;
  int gameHeight = 900;
  boolean atStartup = true;
  boolean startScreenMousePressed = false;
  
  public void settings() {
    //---------- Set the canvas size ----------//
    size(gameWidth, gameHeight);
  }
  
  public void setup() {
    //---------- Everything that only needs to be run once goes in here ----------//
    smooth();
    background(0);
    frameRate(120);
  
    //---------- Make the background music work and turn the volume down to 10% ----------//
    soundtrack = new SoundFile(this, path1);
    soundtrack.amp(0.1f);
  
    //---------- Make the munch sound work and turn the volume down to 10% ----------//
    munch = new SoundFile(this, path2);
    munch.amp(0.1f);
  
    //---------- Call the constructors for the needed classes ----------//
    player = new Skeleton();
    menu = new MenuElements();
  
    for (int i = 0; i < initialPumpkins; i++) { 
      pumpkins.add(new Pumpkin());
    }
  
    //---------- Load the images for the characters and set the anchorpoint of the images ----------//
    skeletonSprite = loadImage("skeleton.png");
    pumpkinSprite = loadImage("jackolantern.png");
    background = loadImage("spook.jpg");
    imageMode(CENTER);
  }
  
  public void draw() {
    //---------- If the game isn't at startup, run the game and start the soundtrack ----------//
    if (!atStartup) {
      game();
      soundTrack();
      //---------- If not, run the start screen ----------//
    } else {
      startScreen();
    }
  }
  
  //---------- When a key is pressed, if it's a coded key, store said key as pressed ----------//
  public void keyPressed() {
    if (key != CODED) {
      player.keys[key] = true;
    }
  }
  
  //---------- When a key is released, if it's a coded key, store said key as not pressed ----------//
  public void keyReleased() {
    if (key != CODED) {
      player.keys[key] = false;
    }
  }
  
  public void startScreen() {
    menu.title();
    menu.buttons();
    menu.interaction();
  }
  
  public void game() {
    //background(125);
    image(background, width/2, height/2);
  
    player.displayHUD();
    player.update();
    player.checkEdges();
    player.checkCollision();
    image(skeletonSprite, player.location.x, player.location.y, player.d, player.d);
  
    for (int i = 0; i < pumpkins.size(); i++) {
      Pumpkin pump = pumpkins.get(i);
      pump.update();
      pump.checkEdges();
      image(pumpkinSprite, pump.location.x, pump.location.y, pump.d, pump.d);
    }
  
    if (pumpkins.size() < minimumPumpkins) {
      pumpkins.add(new Pumpkin());
    }
  }
  
  public void soundTrack() {
    if (soundStarted == false) {
      soundtrack.play();
      soundStarted = true;
    }
  }
  
  class MenuElements {
  
    boolean mouseOverButton1;
    boolean mouseOverButton2 = false;
  
    int buttonWidth;
    int buttonHeight;
  
    int button1PosX;
    int button1PosY;
  
    int button2PosX;
    int button2PosY;
  
    MenuElements() {
      // Constructor for the class
  
      mouseOverButton1 = false;
      mouseOverButton2 = false;
  
      buttonWidth = width/3;
      buttonHeight = height/12;
  
      button1PosX = width/2;
      button1PosY = height/2 + 150;
  
      button2PosX = width/2;
      button2PosY = height/2 + 250;
    }
  
    public void title() {
      textAlign(CENTER, CENTER);
      fill(255, 110, 0);
      textSize(135);
      text("Spook", width/2, 150);
    }
  
    public void loadingScreen() {
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(135);
      text("Loading", width/2, height/2);
    }
  
    public void buttons() {  
      strokeWeight(1);
      stroke(0);
      fill(155);
      rectMode(CENTER);
      rect(button1PosX, button1PosY, buttonWidth, buttonHeight);
      rect(button2PosX, button2PosY, buttonWidth, buttonHeight);
  
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(32);
      text("Start the spookening", width/2, height/2 + 147);
      text("Exit ;'(", width/2, height/2 + 247);
  
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(32);
      text("This game is very buggy and laggy!", width/2, height/2 + 325);
    }
  
    public void interaction() {
  
      if (mouseX >= button1PosX - buttonWidth/2 && mouseX <= button1PosX + buttonWidth/2) {
        if (mouseY >= button1PosY - buttonHeight/2 && mouseY <= button1PosY + buttonHeight/2) {
          mouseOverButton1 = true;
        }
      } else {
        mouseOverButton1 = false;
      }
  
      if (mouseX >= button2PosX - buttonWidth/2 && mouseX <= button2PosX + buttonWidth/2) {
        if (mouseY >= button2PosY - buttonHeight/2 && mouseY <= button2PosY + buttonHeight/2) {
          mouseOverButton2 = true;
        }
      } else {
        mouseOverButton2 = false;
      }
  
      if (mouseOverButton1 && mousePressed == true) {
        atStartup = false;
      }
  
      if (mouseOverButton2 && mousePressed == true) {
        exit();
      }
    }   
  }
  
  class Pumpkin {
  
    PVector location;
    PVector direction;
  
    float d = 75;
    float r = d/2;
  
    float moveSpd = random(2, 7);
  
    int HP = 100;
  
    boolean dead = false;
  
    Pumpkin() {
      // Constructor for the class
  
      // Make mouse, location, velocity, direction, acceleration and speed work.
      location = new PVector(random(0+r, width-r), random(0+r, height-r));
      direction = new PVector(random(-moveSpd, moveSpd), random(-moveSpd, moveSpd));
    }
  
    public void update() {
      location.x += direction.x;
      location.y += direction.y;
    }
  
    public void checkEdges() {
      if (location.x > width-r || location.x < 0+r) {
        direction.x = -direction.x;
      }
      if (location.y > height-r || location.y < 0+r) {
        direction.y = -direction.y;
      }
    }
  }

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

  public void update() {

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

  public void checkEdges() {
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
  
  public void checkCollision() {
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

  public void displayHUD() {
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "spook_main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
