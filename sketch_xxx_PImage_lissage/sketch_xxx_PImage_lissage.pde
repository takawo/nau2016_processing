ArrayList<Lissage> lissages = new ArrayList<Lissage>();
float size = 20;
PImage img;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  background(0, 0, 100);
  img = loadImage("city-q-c-960-540-3.jpg");
  for (float y = 0; y < height; y += size) {
    for (float x = 0; x < width; x += size) {
      color c = img.get((int)x, (int)y);
      Lissage l = new Lissage(x, y, size, c);
      lissages.add(l);
    }
  }
  background(0, 0, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  for (Lissage l : lissages) {
    l.update();
    l.draw();
  }
}
class Lissage {
  float cx;
  float cy;
  float grid;
  float x;
  float y;
  float tx, ty;
  float inc;
  float t = random(TWO_PI);
  color c;
  boolean isFirst = true;
  Lissage(float _cx, float _cy, float _grid, color _c) {
    cx = _cx;
    cy = _cy;
    grid = _grid;
    float brightness = brightness(c);
    float saturation = saturation(c);
    tx = map(brightness, 0, 100, 1f, 20f);
    ty = random(-5,5);
    c = _c;
    inc = 0.01;
  }
  void update() {
    t += inc;
  }

  void draw() {
    //rect(cx,cy,grid,grid);
    fill(c);
    noStroke();
    pushMatrix();
    translate(cx + grid/2, cy+ grid/2);
    ellipse(x(t), y(t), 1, 1);
    popMatrix();
  }

  float x(float t) {
    return cos(t/tx) * grid/2;
  }

  float y(float t) {
    return sin(t/ty) * grid/2;
  }
}
