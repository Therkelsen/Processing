
  //  Function for checking win conditions on a 5x5 board
  void win5x5() {
    int row = 0;
  
    for (int col = 0; col< cols; col++) {
  
      //Cheks for vertical lines for player 1 and 2
      if (board[col][row].checkState() == 1 && board[col][row+1].checkState() == 1 && board[col][row+2].checkState() == 1) {
        win = 1;
      } else if (board[col][row+1].checkState() == 1 && board[col][row+2].checkState() == 1 && board[col][row+3].checkState() == 1) {
        win = 1;
      } else if (board[col][row+2].checkState() == 1 && board[col][row+3].checkState() == 1 && board[col][row+4].checkState() == 1) {
        win = 1;
      } else if (board[col][row].checkState() == 2 && board[col][row+1].checkState() == 2 && board[col][row+2].checkState() == 2) {
        win = 2;
      } else if (board[col][row+1].checkState() == 2 && board[col][row+2].checkState() == 2 && board[col][row+3].checkState() == 2) {
        win = 2;
      } else if (board[col][row+2].checkState() == 2 && board[col][row+3].checkState() == 2 && board[col][row+4].checkState() == 2) {
        win = 2;
      }
  
      //Check for horizontal lines for player 1 and 2
      else if (board[row][col].checkState() == 1 && board[row+1][col].checkState() == 1 && board[row+2][col].checkState() == 1) {
        win = 1;
      } else if (board[row+1][col].checkState() == 1 && board[row+2][col].checkState() == 1 && board[row+3][col].checkState() == 1) {
        win = 1;
      } else if (board[row+2][col].checkState() == 1 && board[row+3][col].checkState() == 1 && board[row+4][col].checkState() == 1) {
        win = 1;
      } else if (board[row][col].checkState() == 2 && board[row+1][col].checkState() == 2 && board[row+2][col].checkState() == 2) {
        win = 2;
      } else if (board[row+1][col].checkState() == 2 && board[row+2][col].checkState() == 2 && board[row+3][col].checkState() == 2) {
        win = 2;
      } else if (board[row+2][col].checkState() == 2 && board[row+3][col].checkState() == 2 && board[row+4][col].checkState() == 2) {
        win = 2;
      }
  
      //Checks diogonals oneway line for player 1 and 2
      if (board[col][row].checkState() == 1 && board[col+1][row+1].checkState() == 1 && board[col+2][row+2].checkState() == 1) {
        win = 1;
      } else if (board[row+1][row+1].checkState() == 1 && board[row+2][row+2].checkState() == 1 && board[row+3][row+3].checkState() == 1) {
        win = 1;
      } else if (board[row+2][row+2].checkState() == 1 && board[row+3][row+3].checkState() == 1 && board[row+4][row+4].checkState() == 1) {
        win = 1;
      } else if (board[row][row].checkState() == 2 && board[row+1][row+1].checkState() == 2 && board[row+2][row+2].checkState() == 2) {
        win = 2;
      } else if (board[row+1][row+1].checkState() == 1 && board[row+2][row+2].checkState() == 2 && board[row+3][row+3].checkState() == 2) {
        win = 2;
      } else if (board[row+2][row+2].checkState() == 1 && board[row+3][row+3].checkState() == 2 && board[row+4][row+4].checkState() == 2) {
        win = 2;
      } 
  
      //Checks diogonals otherway line for player 1 and 2
      else if (board[0][row+4].checkState() == 1 && board[1][row+3].checkState() == 1 && board[2][row+2].checkState() == 1) {
        win = 1;
      } else if (board[1][row+3].checkState() == 1 && board[2][row+2].checkState() == 1 && board[3][row+1].checkState() == 1) {
        win = 1;
      } else if (board[2][row+2].checkState() == 1 && board[3][row+1].checkState() == 1 && board[4][row].checkState() == 1) {
        win = 1;
      } else if (board[0][row+4].checkState() == 2 && board[1][row+3].checkState() == 2 && board[2][row+2].checkState() == 2) {
        win = 2;
      } else if (board[1][row+3].checkState() == 2 && board[2][row+2].checkState() == 2 && board[3][row+1].checkState() == 2) {
        win = 2;
      } else if (board[2][row+2].checkState() == 2 && board[3][row+1].checkState() == 2 && board[4][row].checkState() == 2) {
        win = 2;
      }
    }
  
    //  Write text for win
    if (win == 1 || win == 2) {
      fill(50, 50, 50, 200);
      rectMode(CORNER);
      rect(0, 0, width, height);
      fill(0, 255, 0);
      textSize(height/20);
      text("Press ENTER or ESC", width/2, 8*height/16);
      text("to EXIT the game", width/2, 9*height/16);
  
      if (win == 1) {
        fill(255);
        textSize(height/10);
        text("O wins", width/2, height/4);
      } else if (win == 2) {
        fill(255);
        textSize(height/10);
        text("X wins", width/2, height/4);
      }
    }
  }
