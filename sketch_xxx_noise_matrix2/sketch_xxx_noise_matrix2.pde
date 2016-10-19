// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // 透明度の低い矩形を描画：フェード効果
  fill(0, 0, 100, 10);
  rect(0, 0, width, height);
  
  // yを繰り返して縦の位置を移動
  for (float y0 = -200; y0 < height; y0 += 30) {
    pushMatrix(); //原点座標を保存(左上が原点)
    translate(0, y0); // 原点を移動
    // xを繰り返して横の位置を移動
    for (float x = 0; x < width; x += 5) {
      // 点のy座標をnoise関数（ゆらゆら揺れる値を出力）で計算
      float y = noise(x*0.01, (y0+frameCount)*0.01)*200f;
      // 点を描画
      point(x, y);
    }
    // 原点座標を戻す(左上を0,0に)
    popMatrix();
  }
}