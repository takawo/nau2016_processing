int m=20; 

// setup関数 : 初回1度だけ実行される
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  stroke(186, 20, 80, 100); 
  noSmooth();
  strokeWeight(5);
  strokeCap(ROUND);
  noFill();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 98);
  for (int y=0; y<height; y+=m) {
    for (int x=0; x<width; x+=m) {
      int j=int(noise(x/50f,y/50f,frameCount/100f)*8);
      if (j==1) {
        line(x, y, x+m, y+m);
        line(x, y+m, x+m, y);
      } else if (j==2) {
        line(x, y, x+m, y+m);
      } else if (j==3) {
        line(x, y+m, x+m, y);
      } else if (j==4) {
      }
    }
  }
  //noLoop();
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("pattern-####.png");
  }
}