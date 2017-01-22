// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 10);
  float offset = 100;
  float num = 1000;
  float size = (width-offset)/num;
  for (float x1 = offset; x1 < width-offset; x1 += size) {
    float hue = map(x1, offset, width-offset, 0, 30);
    float x2 = x1+size;
    float y = height/2;
    color c = color(hue, 80, 100);
    strokeCap(SQUARE);
    stroke(c);
    noFill();
    strokeWeight(20);
    line(x1, y, x2, y);
  }
}