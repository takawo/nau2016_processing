// 変数の宣言
int x = 0;
int y = 0;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // 色指定をHSBに
  background(0, 0, 100); // 背景の色を白に
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  
  
  noStroke(); // 線の色をナシに
  fill(frameCount%360, 80, 100); // 色相を循環させる0-360
  // frameCount : 実行中の現在のフレーム数（何フレーム目か）を返すシステム変数
  // システム変数：Processing側で予め用意してくれている便利な変数
  ellipse(x, y, 100, 100);  // 楕円を描画

  x = (x + 5)%width; //xの値を5+
  y = (y + 5)%height; // yの値を5+
}