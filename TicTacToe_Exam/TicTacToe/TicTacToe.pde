  
  //  Create MenuElements object and Cell object
  MenuElements menu;
  Cell[][] board;
  
  //  Size of board
  int cols = 3;
  int rows = 3;
  int side = 3;
  
  //  Game state
  int gameState = 0;
  
  //  Player (0 x 1)
  int player = 0;
  
  //  Winner (0 x 1 x 2)
  int win = 0;
  boolean tied = false;
  
  //  Turns taken
  int turns = 0;
  
  //  Has function been executed?
  boolean executed = false;
  
  //  Limit framerate, set canvas size, draw background and call the constructor for the MenuElements object
  void setup() {
    size(750, 750);
    background(105, 215, 205);
  
    menu = new MenuElements();
  }
  
  //  Reset the entire game, can be run when the game ends.
  void reset() {
    background(105, 215, 205);
    menu = new MenuElements();
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j] = new Cell(0, 0, 0, 0, 0);
      }
    }
    cols = 3;
    rows = 3;
    side = 3;
    gameState = 0;
    player = 0;
    win = 0;
    tied = false;
    turns = 0;
    executed = false;
  }
  
  //  Run either intro , options or game based the gameState value
  void draw() {
    if (gameState == 0) {
      intro();
    } else if (gameState == 1) {
      options();
    } else if (gameState == 2) {
      game();
    }
  }
  
  //  Function for drawing and running the functionality for the intro screen
  void intro() {
    //  Draw background
    background(105, 215, 205);
    //  Calls functions from the menu class
    menu.title();
    menu.startBTN();
    menu.exitBTN();
  }
  
  //  Function for drawing and running the functionality of the options screen
  void options() {
    //  Draw background
    background(105, 215, 205);
  
    //  Calls functions from the menu class
    menu.optionsTitle();
    menu.btnGrid();
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
    //  Run win checker function
    win();
  }
  
  //  Function for instantiating the game board
  void instBoard() {
    //  Set cols and rows to the side size set in the menu class (Has a default value of 3x3, but can be changed at the options screen)
    cols = side;
    rows = side;
  
    // Run constructor for Cell object in index cols and rows
    board = new Cell[cols][rows];
  
    // For every i less than cols and for every j less than rows, create a new cell object with the given parameters for x, y, w, h and s.
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        board[i][j] = new Cell(width/cols*i, height/rows*j, width/cols, height/rows, 5);
      }
    }
  }
