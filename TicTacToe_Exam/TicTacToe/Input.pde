  
  //  When mouse is pressed while gameState is 2 and no one has won yet, run the click function from the board class in index i and j
  void mousePressed() {
    if (gameState == 2) {
      if (win == 0) {
        for (int i = 0; i<cols; i++) {
          for (int j = 0; j<rows; j++) {
            board[i][j].click(mouseX, mouseY);
          }
        }
      }
    }
  }
  
  //  When ENTER or ESC key is pressed while gameState is 2 and either player has won or the game is tied, exit the program
  //  or if BACKSPACE key is pressed while the gameState is 2 and either player has won or the game is tied, reset the program
  void keyPressed() {
    if (gameState == 2) {
      if (win == 1 || win == 2 || tied == true) {
        if (key == ENTER || key == ESC) {
          exit();
        }
        if (key == BACKSPACE) {
          reset();
        }
      }
    }
  }
