Drop[] drops = new Drop[500];

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(240, 8, 98);
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
}