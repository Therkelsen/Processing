  
  //  Function for setting win variable
  void win() {
    
    //  For every row and column, if no one has won, run the win checker function, and attempt to run the winScreen function.
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        if (win == 0) {
          win = checkWin(col, row, board[col][row].state);
        }
      }
    }
	
	if (win == 0 && turns >= cols*rows) {
      tied = true;
    }
	
    winScreen();
  }
  
  // Function for checking win conditions on any board size, 
  // Checks if the given player has put their tile in the set cell (the for loops above cycles through all cells)
  // it also checks in the adjacent cells (both vertically, horizontally and diagonally)
  // To counteract an out of bounds error, a contain function was made which makes sure that we don't check a cell which doesn't exist in the board array  
  // Then if a win condition is met, returns the player who won, or return 0 if no win condition has been met
  int checkWin(int col, int row, int player) {
    if (contain(col-1, side) == true && contain(row-1, side) == true) {
      if (board[col-1][row-1].state == player) {
        if (contain(col+1, side) == true && contain(row+1, side) == true) {
          if (board[col+1][row+1].state == player) {
            return player;
          }
        }
      }
    }
  
    if (contain(row-1, side) == true) {
      if (board[col][row-1].state == player) {
        if (contain(row+1, side) == true) {
          if (board[col][row+1].state == player) {
            return player;
          }
        }
      }
    }
  
    if (contain(col-1, side) == true) {
      if (board[col-1][row].state == player) {
        if (contain(col+1, side) == true) {
          if (board[col+1][row].state == player) {
            return player;
          }
        }
      }
    }
  
    if (contain(col-1, side) == true && contain(row+1, side) == true) {
      if (board[col-1][row+1].state == player) {
        if (contain(col+1, side) == true && contain(row-1, side) == true) {
          if (board[col+1][row-1].state == player) {
            return player;
          }
        }
      }
    }
    return 0;
  }
  
  //  Function to counteract the out of bounds error, makes sure that we don't check a cell that doesn't exist
  //  Returns false if the cell you're trying to check is outside of the array, otherwise it returns true
  boolean contain(int val, int side) {
    if (val < 0 || val > side-1) {
      return false;
    } else {
      return true;
    }
  }
  
  //  Function to draw the win screen if someone has won, or the game is a tie
  void winScreen() {
    
    //  Write text for win if someone has won
    if (win == 1 || win == 2 || tied == true) {
      fill(50, 50, 50, 200);
      rectMode(CORNER);
      rect(0, 0, width, height);
      fill(100, 225, 100);
      textSize(height/20);
      text("Press BACKSPACE", width/2, 8*height/16);
      text("to RESTART the game", width/2, 9*height/16);
  
      fill(255, 50, 50);
      text("Press ESCAPE or ENTER", width/2, 11*height/16);
      text("to EXIT the game", width/2, 12*height/16);
  
      if (win == 1) {
        fill(255);
        textSize(height/10);
        text("O wins!", width/2, height/4);
      } else if (win == 2) {
        fill(255);
        textSize(height/10);
        text("X wins!", width/2, height/4);
      } else if (win == 0) {
	    fill(255);
        textSize(height/10);
        text("Tied!", width/2, height/4);
	  }
    }
  }
