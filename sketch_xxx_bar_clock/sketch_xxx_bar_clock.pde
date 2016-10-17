// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100); // 背景色に白を指定
  float h = hour(); // 時間を取得
  float m = minute(); // 分を取得
  float s = second(); // 秒
  float ms = millis()%1000; //ミリ秒を取得

  drawGraph(h, 24); //描画の関数
  translate(0, height*1/4); //原点のy座標を画面の1/4下にずらす
  drawGraph(m, 60); //描画の関数
  translate(0, height*1/4); //原点のy座標を画面の1/4下にずらす
  drawGraph(s, 60); //描画の関数
  translate(0, height*1/4); //原点のy座標を画面の1/4下にずらす
  drawGraph(ms, 1000); //描画の関数
}

//描画の関数(t=時刻の数値,cols= 目盛りの数)
void drawGraph(float t, float cols) {
  float grid = width/cols; // 目盛りの幅
  if (grid < 5) {
    grid = 5;
  }
  for (float x = 0; x <= width; x += grid ) {
    line(x, 0, x, height/4); // 目盛りを描画
  }
  //時刻を矩形で描画
  fill(map(t, 0, cols, 0, 360), 80, 100, 50); //時間に応じて塗りつぶしの色(色相)を変更
  rect(0, 0, t*width/cols, height/4);
}