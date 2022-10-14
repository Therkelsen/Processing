
PFont font;
PImage skeleton;

void setup() {
  size(500, 500);
  font = createFont("digital-7.ttf", 100);
  skeleton = loadImage("skeleton.png");
  colorMode(HSB, 360, 100, 100);
}

String checkLen(String str) {
  if (str.length() == 1) {
    return "0" + str;
  }
  return str;
}

void drawText(String str, int x, int y, int h, int s, int b, int strW) {
  fill(h, s, b - 25);
  for (int i = 0; i < 4; i++) {
    switch(i) {
    case 0: {
        text(str, x - strW, y - strW);
        break;
      }
    case 1: {
        text(str, x + strW, y - strW);
        break;
      }
    case 2: {
        text(str, x + strW, y + strW);
        break;
      }
    case 3: {
        text(str, x + strW, y + strW);
        break;
      }
    default: {
        break;
      }
    }
  }
  
  fill(h, s, b);
  text(str, x, y);
}

void draw() {
  String hr = checkLen(str(hour()));
  String mn = checkLen(str(minute()));
  String sc = checkLen(str(second()));

  background(51);
  stroke(255);
  //line(0, height/2, width, height/2);
  //line(width/2, 0, width/2, height);

  translate(width/2, height/2);
  
  int strokeWeight = 8;
  
  tint(0, 0, 100);
  imageMode(CENTER);
  image(skeleton, 0, 0, height/1.2 - strokeWeight*4, height/1.2 - strokeWeight*4);
  noTint();

  textFont(font);
  textAlign(CENTER, CENTER);

  drawText(hr, -120, 0, 120, 100, 100, 3);
  drawText(mn, 0, 0, 260, 75, 100, 3);
  drawText(sc, 120, 0, 28, 100, 100, 3);

  strokeWeight(strokeWeight);
  noFill();
  stroke(28, 100, 25);
  arc(0, 0, width/1.2, height/1.2, 0, TWO_PI);
  stroke(28, 100, 100);
  float end = map(int(sc), 0, 60, 0, TWO_PI);
  arc(0, 0, width/1.2, height/1.2, 0, end);
  
  stroke(260, 75, 25);
  arc(0, 0, width/1.2 - strokeWeight*2, height/1.2 - strokeWeight*2, 0, TWO_PI);
  stroke(260, 75, 100);
  end = map(int(mn), 0, 60, 0, TWO_PI);
  arc(0, 0, width/1.2 - strokeWeight*2, height/1.2 - strokeWeight*2, 0, end);
  
  stroke(120, 100, 25);
  arc(0, 0, width/1.2 - strokeWeight*4, height/1.2 - strokeWeight*4, 0, TWO_PI);
  stroke(120, 100, 100);
  end = map(int(hr), 0, 24, 0, TWO_PI);
  arc(0, 0, width/1.2 - strokeWeight*4, height/1.2 - strokeWeight*4, 0, end);
}
