ArrayList<Rect> rects;
PImage img;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(650, 710, FX2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  img = loadImage("yumeminemu.jpg");
  rects = new ArrayList<Rect>();
  background(0, 0, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  for (Rect rect : rects) {
    rect.update();
    rect.display();
  }

  addRect(50);
  checkRect();
}

void checkRect() {
  for (Rect r1 : rects) {
    for (Rect r2 : rects) {
      if (r1.equals(r2) == false) {
        //PVector r1TopLeft = new PVector(r1.x - r1.size, r1.y - r1.size);
        //PVector r1BottomRight = new PVector(r1.x + r1.size, r1.y + r1.size);
        //PVector r2TopLeft = new PVector(r2.x - r2.size, r2.y - r2.size);
        //PVector r2BottomRight = new PVector(r2.x + r2.size, r2.y + r2.size);

        if (r1.x - r1.size <= r2.x + r2.size && r2.x - r2.size <= r1.x + r1.size 
          && r1.y - r1.size <= r2.y + r2.size && r2.y - r2.size <= r1.y + r1.size) {
          r1.alive = false;
          r2.alive = false;
        }
      }
    }
  }
}
void addRect(int n) {
  int i = 0;
  while (i < n) {
    float x = random(width);
    float y = random(height);
    color c = img.get((int)x, (int)y);
    float size = 0;
    Rect r1 = new Rect(x, y, size, c);
    boolean isContained = false;
    for (Rect r2 : rects) {
      if (r1.equals(r2) == false) {
        //PVector r1TopLeft = new PVector(r1.x - r1.size, r1.y - r1.size);
        //PVector r1BottomRight = new PVector(r1.x + r1.size, r1.y + r1.size);
        //PVector r2TopLeft = new PVector(r2.x - r2.size, r2.y - r2.size);
        //PVector r2BottomRight = new PVector(r2.x + r2.size, r2.y + r2.size);

        if (r1.x - r1.size <= r2.x + r2.size && r2.x - r2.size <= r1.x + r1.size 
          && r1.y - r1.size <= r2.y + r2.size && r2.y - r2.size <= r1.y + r1.size) {
          isContained = true;
        }
      }
    }
    if (isContained == false) {
      rects.add(r1);
      i++;
    }
  }
}

class Rect {
  float x;
  float y;
  float size;
  color c;
  boolean alive;
  Rect(float _x, float _y, float _size, color _c) {
    x = _x;
    y = _y;
    size = _size;
    alive = true;
    c = _c;
  }
  void update() {
    if (alive) {
      size += random(1);
    };
  }

  void display() {
    fill(c);
    //noStroke();
    rectMode(CENTER);
    rect(x, y, size*2, size*2);
  }
}