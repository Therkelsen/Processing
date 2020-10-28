  
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
  
    void title() {
      textAlign(CENTER, CENTER);
      fill(255, 110, 0);
      textSize(135);
      text("Spook", width/2, 150);
    }
  
    void loadingScreen() {
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(135);
      text("Loading", width/2, height/2);
    }
  
    void buttons() {  
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
  
    void interaction() {
  
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
