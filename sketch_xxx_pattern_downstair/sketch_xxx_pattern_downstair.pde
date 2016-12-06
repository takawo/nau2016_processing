float grid = 30;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  for (float x = -width; x < width; x += grid) {
    float x2 = x;
    float y = 0;
    while (y < height) {
      strokeWeight(grid/4);
      line(x2+grid/2, y, x2+grid/2, y+grid);
      strokeWeight(grid/8);
      line(x2, y, x2+grid/2, y);
      x2 += grid/2;
      y += grid;
    }
  }
}