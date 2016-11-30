ArrayList<Rain> rains = new ArrayList<Rain>();
float grid = 5;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (float x = 0; x < width; x += grid) {
    float y = random(-200, -100);
    Rain r = new Rain(x, y);
    rains.add(r);
  }
  background(0, 0, 25);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  noStroke();
  fill(0, 0, 25, 3);
  rect(0, 0, width, height);
  for (Rain r : rains) {
    r.update();
    r.draw();
  }
}

class Rain {
  float x, y;
  float speed;
  float len;
  Rain(float _x, float _y) {
    x = _x;
    y = _y;
    speed = random(1, 2);
    len = random(30, 60);
  }
  void update() {
    y += speed;
    if (y  > height) {
      y = random(-200, -100);
    }
  }
  void draw() {
    strokeWeight(grid);
    stroke(200, 80, 100);
    line(x, y, x, y+len);
  }
}
