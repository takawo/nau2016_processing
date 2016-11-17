float diameter = 30;
ArrayList<Point> points;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  frameRate(60);
  points = new ArrayList<Point>();
  for (int x = 0; x <= width; x += diameter) {
    for (int i = 0; i < 10; i++) { 
      points.add(new Point(x, random(height)));
    }
  }
  background(0, 0, 10);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  fill(0, 0, 0, 1);
  rect(0, 0, width, height);
  for (Point point : points) {
    point.update();
    point.display();
  }
}

class Point {
  PVector pos;
  PVector vel;
  PVector left = new PVector(-1, 0);
  PVector right = new PVector(1, 0);
  boolean isLeft = false;
  boolean isRight = false;
  int counter = 0;
  color[] colors = {#623C62,#2C1B31,#B04361,#FA7066,#FEBB62};
  color c;
  Point(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, random(-1,-2.5));
    c = colors[int(random(colors.length))];
  }
  void update() {
    if (random(1) < 0.005 && isLeft == false && isRight == false) {
      isLeft = true;
    }
    if (random(1) > 0.995 && isRight == false && isLeft == false) {
      isRight = true;
    }
    if (isLeft && counter < diameter) {
      pos.add(left);
      counter++;
    }
    if (isRight && counter < diameter) {
      pos.add(right);
      counter++;
    }
    if (counter >= diameter) {
      counter = 0;
      isLeft = false;
      isRight = false;
      changeColor();
    }


    pos.add(vel);
    if (pos.x < 0) {
      pos.x += width;
      changeColor();
    }
    if (pos.x > width) {
      pos.x -= width;
      changeColor();
    }
    if (pos.y < 0) {
      pos.y += height;
      changeColor();
    }
    if (pos.y > height) {
      pos.x -= height;
      changeColor();
    }
  }
  void changeColor(){
      c = colors[int(random(colors.length))];
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(pos.x, pos.y, diameter/8, diameter/8);
  }
}
