  
  //---------- Import the sound library to play sound -----//
  import processing.sound.*;
  
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
  int initialPumpkins = int(random(10, 25));
  int minimumPumpkins = 10;
  int amountToSpawn = int(random(1, 5));
  
  //---------- Variables needed for the main game ----------//
  int gameWidth = 1280;
  int gameHeight = 900;
  boolean atStartup = true;
  boolean startScreenMousePressed = false;
  
  void settings() {
    //---------- Set the canvas size ----------//
    size(gameWidth, gameHeight);
  }
  
  void setup() {
    //---------- Everything that only needs to be run once goes in here ----------//
    smooth();
    background(0);
    frameRate(120);
  
    //---------- Make the background music work and turn the volume down to 10% ----------//
    soundtrack = new SoundFile(this, path1);
    soundtrack.amp(0.1);
  
    //---------- Make the munch sound work and turn the volume down to 10% ----------//
    munch = new SoundFile(this, path2);
    munch.amp(0.1);
  
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
  
  void draw() {
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
  void keyPressed() {
    if (key != CODED) {
      player.keys[key] = true;
    }
  }
  
  //---------- When a key is released, if it's a coded key, store said key as not pressed ----------//
  void keyReleased() {
    if (key != CODED) {
      player.keys[key] = false;
    }
  }
  
  void startScreen() {
    menu.title();
    menu.buttons();
    menu.interaction();
  }
  
  void game() {
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
  
  void soundTrack() {
    if (soundStarted == false) {
      soundtrack.play();
      soundStarted = true;
    }
  }
