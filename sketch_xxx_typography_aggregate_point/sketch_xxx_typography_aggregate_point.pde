PGraphics graphic;
ArrayList<Point> points = new ArrayList<Point>();
int grid = 5;
color backgroundColor;

// setup関数 : 初回1度だけ実行される
void setup() {
  // fullScreen();
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  backgroundColor = color(0, 0, 100);
  PFont font = createFont("YuGothic-Bold", 300);

  graphic = createGraphics(width, height);
  graphic.beginDraw();
  graphic.colorMode(HSB, 360, 100, 100, 100);
  graphic.background(0, 0, 100);
  graphic.textAlign(CENTER, CENTER);
  graphic.textFont(font, 300);
  graphic.fill(0, 0, 0);
  graphic.text("地獄", width/2, height/2);
  graphic.endDraw();

  for (int y = 0; y < height; y += grid) {
    for (int x = 0; x < width; x += grid) {
      if (brightness(graphic.get(x, y)) < 1) {
        fill(0, 0, 0);
        noStroke();
        ellipse(x, y, grid, grid);
        points.add(new Point(x, y));
      }
    }
  }
  background(0, 0, 0);
}


// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  fill(0, 0, 0, 50);
  rect(0, 0, width, height);
  for (Point p : points) {
    p.update();
    p.display();
  }
}

class Point {
  PVector pos;
  PVector vel;
  Point(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
  }
  void update() {
    pos.add(vel);
    PVector newPos = PVector.add(pos, vel);
    if (graphic.get((int)newPos.x, (int)newPos.y) == backgroundColor) {
      vel.rotate(PI);
    }
  }
  void display() {
    fill(0, 0, 100);
    ellipse(pos.x, pos.y, 5, 5);
  }
}
