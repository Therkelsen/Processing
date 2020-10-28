  
  //  Create variables for the Cell class
  class Cell {
    //  Variables for X and Y coordinates, width, height, stroke width and state.
    int x;
    int y;
    int w;
    int h;
    int s;
    int state = 0;
    int temp;
    
    //  Constructor sets class variables with given parameters
    Cell(int tx, int ty, int tw, int th, int ts) {
      x = tx;
      y = ty;
      w = tw;
      h = th;
      s = ts;
    }
    
    //  Function for figuring out where to draw X or O
    void click(int tx, int ty) {
      //  Set mouse position
      int mx = tx;
      int my = ty;
      
      //  Decides where to draw X or O depending on the mouse position, remembers whose turn it is and keeps track of the turns taken
      if (mx > x && mx < x+w && my > y && my < y+h) {    
        if (player == 0 && state == 0) {
          state = 1;
          player = 1;
          turns++;
        } else if (player == 1 && state == 0) {
          state = 2;
          player = 0;
          turns++;
        }
      }
    }
    
    //  Function for displaying the X and O in cells
    void display() {
      rectMode(CORNER);
      fill(105, 215, 205);
      stroke(100);
      rect(x, y, w, h);
      strokeWeight(s);
      
      //  Draw an ellipse for O and a cross for X
      if (state == 1) {
        ellipseMode(CORNER);
        stroke(0, 0, 255);
        ellipse(x+4*s, y+4*s, w-8*s, h-8*s);
      } else if (state == 2) {
        stroke(255, 0, 0);
        line(x+4*s, y+4*s, (x+w)-4*s, (y+h)-4*s); 
        line((x+w)-4*s, y+4*s, x+4*s, (y+h)-4*s);
      }
    }
  }
