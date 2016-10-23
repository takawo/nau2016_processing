// 変数の宣言
int x = 0; // ボールのx座標
int y = 0; // ボールのy座標
int xStep = 5; // ボールのx方向のスピード
int yStep = 5; // ボールのy方向のスピード

color c;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // 色指定をHSBに
  background(0, 0, 100); // 背景の色を白に
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0,0,100);
  noStroke(); // 線の色をナシに
  fill(c); // 色相を循環させる0-360
  // frameCount : 実行中の現在のフレーム数（何フレーム目か）を返すシステム変数
  // システム変数：Processing側で予め用意してくれている便利な変数
  ellipse(x, y, 100, 100);  // 楕円を描画
  
  x = x + xStep;
  y = y + yStep;


}