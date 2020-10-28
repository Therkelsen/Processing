
  //  Create variables for the MenuElements class
  class MenuElements {
    
    //  A bunch of variables for buttons, titles and the board, checking if mouse is over, widths, heights, X coordinates, Y coordinates, buffers, sizes and a temp for interaction
    boolean mouseOverBTN;
  
    int btnWidth;
    int btnHeight;
  
    int btn1PosX;
    int btn1PosY;
  
    int btn2PosX;
    int btn2PosY;
  
    int gridBTNPosX, gridBTNPosY;
    int gridBTNSize;
    int buffer;
    int buffer2;
    
    int titleSz;
    int subtitleSz;
    int btnSz;
  
    boolean temp;
    
    //  Constructor sets class variables
    //  Most of it is based on the width and height of the canvas, so the game should in theory be able to scale to any resolution picked in the code.
    
    MenuElements() {
      // Constructor for the class
      mouseOverBTN = false;
  
      btnWidth = width/3;
      btnHeight = height/12;
  
      btn1PosX = width/2;
      btn1PosY = 3*height/4;
  
      btn2PosX = width/2;
      btn2PosY = 7*height/8;
      
      titleSz = height/8;
      btnSz = height/20;
      subtitleSz = height/30;  
  
      gridBTNSize = width/5;
      buffer = gridBTNSize/10;
      buffer2 = height/166;
  
      gridBTNPosX = width/4;
      gridBTNPosY = height/4;
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
    void startBTN() {
      //  Draws box for button
      strokeWeight(1);
      stroke(50);
      fill(118, 154, 220);
      rectMode(CENTER);
      rect(btn1PosX, btn1PosY, btnWidth, btnHeight);
  
      //  Inserts text for button
      textAlign(CENTER, CENTER);
      fill(50);
      textSize(btnSz);
      if(gameState == 0) {
        text("Play", btn1PosX, btn1PosY - buffer2);
      } else if (gameState == 1) {
        text("Start", btn1PosX, btn1PosY - buffer2);
      }
  
      //  Calculates button area to get pressed
      if (mouseX >= btn1PosX - btnWidth/2 && mouseX <= btn1PosX + btnWidth/2 && mouseY >= btn1PosY - btnHeight/2 && mouseY <= btn1PosY + btnHeight/2) {
        mouseOverBTN = true;
      } else {
        mouseOverBTN = false;
      }
  
      //  If the mouse isn't pressed, set temp to true so the button can be pressed
      if (!mousePressed) {
        temp = true;
      }
      
      //  Adds 1 to gameState if the button is pressed and sets temp to make the button only work once every click
      if (mouseOverBTN && mousePressed && temp) {
        gameState++;
        temp = false;
      }
    }
	
	//  Drawing and functionality for the Exit button
    void exitBTN() {
      //  Draws box for button
      strokeWeight(1);
      stroke(50);
      fill(118, 154, 220);
      rectMode(CENTER);
      rect(btn2PosX, btn2PosY, btnWidth, btnHeight);
  
      //  Inserts text for button
      textAlign(CENTER, CENTER);
      fill(50);
      textSize(btnSz);
      text("Exit", btn2PosX, btn2PosY - buffer2);
  
      //  Calculates button area to get pressed
      if (mouseX >= btn2PosX - btnWidth/2 && mouseX <= btn2PosX + btnWidth/2 && mouseY >= btn2PosY - btnHeight/2 && mouseY <= btn2PosY + btnHeight/2) {
        mouseOverBTN = true;
      } else {
        mouseOverBTN = false;
      }
  
      //  If the mouse isn't pressed, set temp to true so the button can be pressed
      if (!mousePressed) {
        temp = true;
      }
      
      //  Exits program if the button is pressed
      if (mouseOverBTN && mousePressed && temp) {
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
      text("Choose board size", width/2, 16*height/64);
      text("Hint: 3x3 is the default size", width/2, 19*height/64);
      text("and the win condition won't change", width/2, 22*height/64);
    }
  
    void btnGrid() {  //draws grid for selection of board size
     //  Draws boxes for buttons
      rectMode(CENTER);
      strokeWeight(1);
      stroke(50);
      
      if(side == 3) {
        fill(140, 180, 255);
      } else {
        fill(118, 154, 220);
      }
      rect(gridBTNPosX + buffer, 2*gridBTNPosY, gridBTNSize, gridBTNSize);
      
      if(side == 5) {
        fill(140, 180, 255);
      } else {
        fill(118, 154, 220);
      }
      rect(2*gridBTNPosX, 2*gridBTNPosY, gridBTNSize, gridBTNSize);
      
      if(side == 7) {
        fill(140, 180, 255);
      } else {
        fill(118, 154, 220);
      }
      rect(3*gridBTNPosX - buffer, 2*gridBTNPosY, gridBTNSize, gridBTNSize);
  
      //  Inserts text for buttons
      textAlign(CENTER, CENTER);
      fill(50);
      textSize(btnSz);
      text("3x3", gridBTNPosX + buffer, 2*gridBTNPosY-2);
      text("5x5", 2*gridBTNPosX, 2*gridBTNPosY-2);
      text("7x7", 3*gridBTNPosX - buffer, 2*gridBTNPosY-2);
  
      //  Calculates button area to get pressed for button 1
      if (mouseX >= gridBTNPosX + buffer - gridBTNSize/2 && mouseX <= gridBTNPosX + buffer + gridBTNSize/2 && mouseY >= 2*gridBTNPosY - gridBTNSize/2 && mouseY <= 2*gridBTNPosY + gridBTNSize/2) {
        mouseOverBTN = true;
      } else {
        mouseOverBTN = false;
      }
  
      //  If the mouse isn't pressed, set temp to true so the button can be pressed
      if (!mousePressed) {
        temp = true;
      }
      
      //  Sets side to 3 if the button is pressed and sets temp to make the button only work once every click
      if (mouseOverBTN && mousePressed && temp) {
        side = 3;
        temp = false;   
      }
  
      //  Calculates button area to get pressed for button 2
      if (mouseX >= 2*gridBTNPosX - gridBTNSize/2 && mouseX <= 2*gridBTNPosX + gridBTNSize/2 && mouseY >= 2*gridBTNPosY - gridBTNSize/2 && mouseY <= 2*gridBTNPosY + gridBTNSize/2) {
        mouseOverBTN = true;
      } else {
        mouseOverBTN = false;
      }
      
      //  Sets side to 5 if the button is pressed and sets temp to make the button only work once every click
      if (mouseOverBTN && mousePressed && temp) {
        side = 5;
        temp = false;
      }
  
      //  Calculates button area to get pressed for button 3
      if (mouseX >= 3*gridBTNPosX - buffer - gridBTNSize/2 && mouseX <= 3*gridBTNPosX - buffer + gridBTNSize/2 && mouseY >= 2*gridBTNPosY - gridBTNSize/2 && mouseY <= 2*gridBTNPosY + gridBTNSize/2) {
        mouseOverBTN = true;
      } else {
        mouseOverBTN = false;
      }
      
      //  Sets side to 7 if the button is pressed and sets temp to make the button only work once every click
      if (mouseOverBTN && mousePressed && temp) {
        side = 7;
        temp = false;
      }   
    }

    void backBTN() {
      //  Draws box for button
      strokeWeight(1);
      stroke(50);
      fill(118, 154, 220);
      rectMode(CENTER);
      rect(btn2PosX, btn2PosY, btnWidth, btnHeight);
  
      //  Inserts text for button
      textAlign(CENTER, CENTER);
      fill(50);
      textSize(btnSz);
      text("Back", btn2PosX, btn2PosY - buffer2);
  
      //  Calculates button area to get pressed
      if (mouseX >= btn2PosX - btnWidth/2 && mouseX <= btn2PosX + btnWidth/2 && mouseY >= btn2PosY - btnHeight/2 && mouseY <= btn2PosY + btnHeight/2) {
        mouseOverBTN = true;
      } else {
        mouseOverBTN = false;
      }
  
      //  If the mouse isn't pressed, set temp to true so the button can be pressed
      if (!mousePressed) {
        temp = true;
      }
      
      //  Subtracts 1 from gameState if the button is pressed and sets temp to make the button only work once every click
      if (mouseOverBTN && mousePressed && temp) {
        gameState--;
        temp = false;
      }
    }
  }
