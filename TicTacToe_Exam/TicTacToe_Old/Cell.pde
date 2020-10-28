  
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
      //  Decides where to draw X or O depending on the mouse position and whose turn it is
      if (mx > x && mx < x+w && my > y && my < y+h) {    
        if (player == 0 && state == 0) {
          state = 1;
          player = 1;
        } else if (player == 1 && state == 0) {
          state = 2;
          player = 0;
        }
      }     
    }
    
    //  Function for resetting state
    void clean() {    
      state = 0;
    }
    
    // Function for checking what the state is
    int checkState() {
      return state;
    }
    
    //  Function for checking what the X coordinate is
    int checkX() {
      return x;
    }
    
    //  Function for checking what the Y coordinate is
    int checkY() {
      return y;
    }
    
    //  Function for displaying the X and O
    void display() {
      rectMode(CORNER);
      fill(105, 215, 205);
      stroke(100);
      strokeWeight(s);
      rect(x, y, w, h);
      
      //  Draw an ellipse for O and a cross for X
      if (state == 1) {    
        ellipseMode(CORNER);
        stroke(0, 0, 255);
        ellipse(x+2*s, y+2*s, w-4*s, h-4*s);
      } else if (state == 2) {
        stroke(255, 0, 0);
        line(x+2*s, y+2*s, (x+w)-2*s, (y+h)-2*s); 
        line((x+w)-2*s, y+2*s, x+2*s, (y+h)-2*s);
      }
    }
  }
