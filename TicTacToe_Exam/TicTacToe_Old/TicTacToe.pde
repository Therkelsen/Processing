  
  //  Create MenuElements object and Cell object
  MenuElements menu;
  Cell[][] board;
  
  //  Size of board
  int cols = 5;
  int rows = 5;
  
  //  Game state
  int gameState = 0;
  
  //  Player (0 x 1)
  int player = 0;
  
  //  Winner (0 x 1 x 2)
  int win = 0;
  
  //  Has function been executed?
  boolean executed = false;
  
  //  Limit framerate, set canvas size, draw background and call the constructor for the MenuElements object
  void setup() {
    frameRate(60);
    size(750, 750);
    background(105, 215, 205);
  
    menu = new MenuElements();
  }
  
  //  Run either intro function, options function or game based the gameState value
  void draw() {
    if (gameState == 0) {
      intro();
    }
  
    
    if (gameState == 1) {
      options();
      //  Set cols and rows to the boardsize set in the menu class (Has a default value of 3x3, but can be changed at the options screen) 
      cols = menu.boardSize;
      rows = menu.boardSize;
    }
  
    
    if (gameState == 2) {
      game();
    }
  }
  
  //  Function for drawing and running the functionality fof the intro screen
  void intro() {
    //  Draw background
    background(105, 215, 205);
    //  Calls functions from the menu class
    menu.title();
    menu.playBTN();
    menu.exitBTN();
  }
  
  //  Function for drawing and running the functionality of the options screen
  void options() {
    //  Draw background
    background(105, 215, 205);
    //  Calls functions from the menu class
    menu.optionsTitle();
    menu.buttonGrid();
    menu.startBTN();
    menu.backBTN();
  }
  
  //  Function for drawing and running the functionality of the game
  void game() {
    //  Draw background
    background(105, 215, 205);
    //  If function hasn't been executed, instantiate board and remember that it was executed
    if (!executed) {    
      instBoard();
      executed = true;
    }
    
    //  For every i less than cols and for every j less than rows, display the board in index i and j
    for (int i = 0; i<cols; i++) {
      for (int j = 0; j<rows; j++) {
        board[i][j].display();
      }
    }
    
    //  Run win checker function for whichever board size was picked earlier
    if (cols == 3) {
      if (rows == 3) {               
        win3x3();
      }
    } else if (cols == 5) {
      if (rows == 5) {
        win5x5();
      }
    } else if (cols == 7) {
      if (rows == 7) {
        win7x7();
      }
    }
  }
  
  //  Function for instantiating the game board
  void instBoard() {
    // Run constructor for Cell object in index cols and rows
    board = new Cell[cols][rows];    
    // For every i less than cols and for every j less than rows, create a new cell object with the given parameters for x, y, w, h and s.
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j] = new Cell(width/cols*i, height/rows*j, width/cols, height/rows, 3);
      }
    }
  }
