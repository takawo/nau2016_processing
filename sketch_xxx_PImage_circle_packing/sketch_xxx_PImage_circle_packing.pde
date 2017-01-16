ArrayList<Circle> circles;
PImage img;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(650, 710, FX2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  img = loadImage("yumeminemu.jpg");
  circles = new ArrayList<Circle>();
  background(0, 0, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  for (Circle c : circles) {
    c.update();
    c.display();
  }

  addCircle(10);
  checkCircle();
}

void checkCircle() {
  for (Circle c1 : circles) {
    for (Circle c2 : circles) {
      if (c1.equals(c2) == false) {
        float d = dist(c1.x, c1.y, c2.x, c2.y);
        if (d < c1.r+c2.r) {
          c1.alive = false;
          c2.alive = false;
        }
      }
    }
  }
}
void addCircle(int n) {
  int i = 0;
  while (i < n) {
    float x = random(width);
    float y = random(height);
    color c = img.get((int)x, (int)y);
    float r = 0;
    Circle c1 = new Circle(x, y, r, c);
    boolean isContained = false;
    for (Circle c2 : circles) {
      if (c1.equals(c2) == false) {
        float d = dist(c1.x, c1.y, c2.x, c2.y);
        if (d < c1.r + c2.r) {
          isContained = true;
        }
      }
    }
    if (isContained == false) {
      circles.add(c1);
      i++;
    }
  }
}

class Circle {
  float x;
  float y;
  float r;
  color c;
  boolean alive;
  Circle(float _x, float _y, float _r, color _c) {
    x = _x;
    y = _y;
    r = _r;
    alive = true;
    c = _c;
  }
  void update() {
    if (alive) {
      r += 1;
    };
  }

  void display() {
    fill(c);
    //noStroke();
    ellipse(x, y, r*2, r*2);
  }
}