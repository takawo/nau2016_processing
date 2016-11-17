float size;
float sizeMin = 0;
float sizeMax = sqrt(100 * 100 + 100 * 100);

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  rectMode(CENTER);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // 背景を白に
  background(0, 0, 50);
  // 画面の中心に
  translate(width/2, height/2);

  // 半径をマウス位置に応じて30-300の範囲に指定
  float size = map(sin(frameCount*0.1), -1, 1, sizeMin, sizeMax);

  beginShape();
  for (float angle = 0; angle < 360; angle += 1f) {
    float theta = radians(angle);
    float x = cos(theta) * size;
    float y = sin(theta) * size;
    x = constrain(x, -100f, 100f);
    y = constrain(y, -100f, 100f);
    vertex(x, y);
  }
  endShape(CLOSE);

}
