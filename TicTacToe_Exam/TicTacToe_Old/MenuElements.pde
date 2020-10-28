
  //  Create variables for the MenuElements class
  class MenuElements {
    
    //  A bunch of variables for buttons, titles and the board, checking if mouse is over, widths, heights, X coordinates, Y coordinates, buffers, sizes and a temp for interaction
    boolean mouseOverButton;
  
    int buttonWidth;
    int buttonHeight;
  
    int button1PosX;
    int button1PosY;
  
    int button2PosX;
    int button2PosY;
  
    int gridButtonPosX, gridButtonPosY;
    int gridButtonSize;
    int buffer;
    int buffer2;
    
    int titleSz;
    int subtitleSz;
    int buttonSz;
  
    boolean temp;

    int boardSize;
    
    //  Constructor sets class variables
    //  Most of it is based on the width and height of the canvas, so the game should in theory be able to scale to any resolution picked in the code.
    
    MenuElements() {
      // Constructor for the class
      mouseOverButton = false;
  
      buttonWidth = width/3;
      buttonHeight = height/12;
  
      button1PosX = width/2;
      button1PosY = 3*height/4;
  
      button2PosX = width/2;
      button2PosY = 7*height/8;
      
      titleSz = height/8;
      buttonSz = height/20;
      subtitleSz = height/30;  
  
      gridButtonSize = width/5;
      buffer = gridButtonSize/10;
      buffer2 = height/166;
  
      gridButtonPosX = width/4;
      gridButtonPosY = height/4;
  
      boardSize = 3;
    }
  
    /****************************************************************/
    /*                        START SCREEN                          */
    /****************************************************************/
    
    //  Draws the main title on the title screen
    void title() {
      textAlign(CENTER, CENTER);
      fill(50,80,80);
      textSize(titleSz);
      text("Tic", width/2, 2*height/16);
      text("Tac", width/2, 5*height/16);
      text("Toe", width/2, 8*height/16);
    }
    
    //  Drawing and functionality for the Play button
    void playBTN() {
      //  Draws box for button
      strokeWeight(1);
      stroke(50);
      fill(155);
      rectMode(CENTER);
      rect(button1PosX, button1PosY, buttonWidth, buttonHeight);
  
      //  Inserts text for button
      textAlign(CENTER, CENTER);
      fill(50);
      textSize(buttonSz);
      text("Play", button1PosX, button1PosY - buffer2);
  
      //  Calculates button area to get pressed
      if (mouseX >= button1PosX - buttonWidth/2 && mouseX <= button1PosX + buttonWidth/2 && mouseY >= button1PosY - buttonHeight/2 && mouseY <= button1PosY + buttonHeight/2) {
        mouseOverButton = true;
      } else {
        mouseOverButton = false;
      }
  
      //  If the mouse isn't pressed, set temp to true so the button can be pressed
      if (!mousePressed) {
        temp = true;
      }
      
      //  Adds 1 to gameState if the button is pressed and sets temp to make the button only work once every click
      if (mouseOverButton && mousePressed && temp) {
        gameState++;
        temp = false;
      }
    }
  
    void exitBTN() {
      //  Draws box for button
      strokeWeight(1);
      stroke(50);
      fill(155);
      rectMode(CENTER);
      rect(button2PosX, button2PosY, buttonWidth, buttonHeight);
  
      //  Inserts text for button
      textAlign(CENTER, CENTER);
      fill(50);
      textSize(buttonSz);
      text("Exit", button2PosX, button2PosY - buffer2);
  
      //  Calculates button area to get pressed
      if (mouseX >= button2PosX - buttonWidth/2 && mouseX <= button2PosX + buttonWidth/2 && mouseY >= button2PosY - buttonHeight/2 && mouseY <= button2PosY + buttonHeight/2) {
        mouseOverButton = true;
      } else {
        mouseOverButton = false;
      }
  
      //  If the mouse isn't pressed, set temp to true so the button can be pressed
      if (!mousePressed) {
        temp = true;
      }
      
      //  Exits program if the button is pressed
      if (mouseOverButton && mousePressed && temp) {
        exit();
      }
    }
  
    /****************************************************************/
    /*                       OPTION SCREEN                          */
    /****************************************************************/
  
    void optionsTitle() {
      textAlign(CENTER, CENTER);
      fill(50);
      textSize(titleSz);
      text("Options", width/2, height/8);
      textSize(subtitleSz);
      text("Choose board size", width/2, height/4);
      text("Hint: 3x3 is the default size", width/2, height/3);
    }
  
    void buttonGrid() {  //draws grid for selection of board size
     //  Draws boxes for buttons
      rectMode(CENTER);
      strokeWeight(1);
      stroke(50);
      
      switch (boardSize) {
      case 3:
        fill(200);
        rect(gridButtonPosX + buffer, 2*gridButtonPosY, gridButtonSize, gridButtonSize);
        fill(155);
        rect(2*gridButtonPosX, 2*gridButtonPosY, gridButtonSize, gridButtonSize);
        fill(155);
        rect(3*gridButtonPosX - buffer, 2*gridButtonPosY, gridButtonSize, gridButtonSize);
        break;
      case 5:
        fill(155);
        rect(gridButtonPosX + buffer, 2*gridButtonPosY, gridButtonSize, gridButtonSize);
        fill(200);
        rect(2*gridButtonPosX, 2*gridButtonPosY, gridButtonSize, gridButtonSize);
        fill(155);
        rect(3*gridButtonPosX - buffer, 2*gridButtonPosY, gridButtonSize, gridButtonSize);
        break;
      case 7:
        fill(155);
        rect(gridButtonPosX + buffer, 2*gridButtonPosY, gridButtonSize, gridButtonSize);
        fill(155);
        rect(2*gridButtonPosX, 2*gridButtonPosY, gridButtonSize, gridButtonSize);
        fill(200);
        rect(3*gridButtonPosX - buffer, 2*gridButtonPosY, gridButtonSize, gridButtonSize);
        break;
      }
      
  
      //  Inserts text for buttons
      textAlign(CENTER, CENTER);
      fill(50);
      textSize(buttonSz);
      text("3x3", gridButtonPosX + buffer, 2*gridButtonPosY-2);
      text("5x5", 2*gridButtonPosX, 2*gridButtonPosY-2);
      text("7x7", 3*gridButtonPosX - buffer, 2*gridButtonPosY-2);
  
      //  Calculates button area to get pressed for button 1
      if (mouseX >= gridButtonPosX + buffer - gridButtonSize/2 && mouseX <= gridButtonPosX + buffer + gridButtonSize/2 && mouseY >= 2*gridButtonPosY - gridButtonSize/2 && mouseY <= 2*gridButtonPosY + gridButtonSize/2) {
        mouseOverButton = true;
      } else {
        mouseOverButton = false;
      }
  
      //  If the mouse isn't pressed, set temp to true so the button can be pressed
      if (!mousePressed) {
        temp = true;
      }
      
      //  Sets boardSize to 3 if the button is pressed and sets temp to make the button only work once every click
      if (mouseOverButton && mousePressed && temp) {
        boardSize = 3;
        temp = false;   
      }
  
      //  Calculates button area to get pressed for button 2
      if (mouseX >= 2*gridButtonPosX - gridButtonSize/2 && mouseX <= 2*gridButtonPosX + gridButtonSize/2 && mouseY >= 2*gridButtonPosY - gridButtonSize/2 && mouseY <= 2*gridButtonPosY + gridButtonSize/2) {
        mouseOverButton = true;
      } else {
        mouseOverButton = false;
      }
      
      //  Sets boardSize to 5 if the button is pressed and sets temp to make the button only work once every click
      if (mouseOverButton && mousePressed && temp) {
        boardSize = 5;
        temp = false;
      }
  
      //  Calculates button area to get pressed for button 3
      if (mouseX >= 3*gridButtonPosX - buffer - gridButtonSize/2 && mouseX <= 3*gridButtonPosX - buffer + gridButtonSize/2 && mouseY >= 2*gridButtonPosY - gridButtonSize/2 && mouseY <= 2*gridButtonPosY + gridButtonSize/2) {
        mouseOverButton = true;
      } else {
        mouseOverButton = false;
      }
      
      //  Sets boardSize to 7 if the button is pressed and sets temp to make the button only work once every click
      if (mouseOverButton && mousePressed && temp) {
        boardSize = 7;
        temp = false;
      }
    }
  
    void startBTN() {
      //  Draws box for button
      strokeWeight(1);
      stroke(50);
      fill(155);
      rectMode(CENTER);
      rect(button1PosX, button1PosY, buttonWidth, buttonHeight);
  
      //  Inserts text for button
      textAlign(CENTER, CENTER);
      fill(50);
      textSize(buttonSz);
      text("Start", button1PosX, button1PosY - buffer2);
  
      //  Calculates button area to get pressed
      if (mouseX >= button1PosX - buttonWidth/2 && mouseX <= button1PosX + buttonWidth/2 && mouseY >= button1PosY - buttonHeight/2 && mouseY <= button1PosY + buttonHeight/2) {
        mouseOverButton = true;
      } else {
        mouseOverButton = false;
      }
  
      //  If the mouse isn't pressed, set temp to true so the button can be pressed
      if (!mousePressed) {
        temp = true;
      }
      
      //  Adds 1 to gameState if the button is pressed and sets temp to make the button only work once every click
      if (mouseOverButton && mousePressed && temp) {
        gameState++;
        temp = false;
      }
    }
  
    void backBTN() {
      //  Draws box for button
      strokeWeight(1);
      stroke(50);
      fill(155);
      rectMode(CENTER);
      rect(button2PosX, button2PosY, buttonWidth, buttonHeight);
  
      //  Inserts text for button
      textAlign(CENTER, CENTER);
      fill(50);
      textSize(buttonSz);
      text("Back", button2PosX, button2PosY - buffer2);
  
      //  Calculates button area to get pressed
      if (mouseX >= button2PosX - buttonWidth/2 && mouseX <= button2PosX + buttonWidth/2 && mouseY >= button2PosY - buttonHeight/2 && mouseY <= button2PosY + buttonHeight/2) {
        mouseOverButton = true;
      } else {
        mouseOverButton = false;
      }
  
      //  If the mouse isn't pressed, set temp to true so the button can be pressed
      if (!mousePressed) {
        temp = true;
      }
      
      //  Subtracts 1 from gameState if the button is pressed and sets temp to make the button only work once every click
      if (mouseOverButton && mousePressed && temp) {
        gameState--;
        temp = false;
      }
    }
  }
