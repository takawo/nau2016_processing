
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  noFill();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  //マウスを押したときだけ実行
  if (mousePressed) { 
    // 1000回繰り返す
    for (int i =0; i < 1000; i++) {
      float r1 = randomGaussian(); // ガウス分布でランダムに数値を取得 
      float r2 = randomGaussian();
      float x = r1 * 30 + mouseX;  // x座標をマウス座標を平均として計算
      float y = r2 * 30 + mouseY;  // y座標をマウス座標を平均として計算

      // 色はランダムに作成
      float h = random(360); 
      float s = random(50, 100);
      float b = random(50, 100);
      stroke(h, s, b); //線の色を指定
      point(x, y); //点を描画
    }
  }
}