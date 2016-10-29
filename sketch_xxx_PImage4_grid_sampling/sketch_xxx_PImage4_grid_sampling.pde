// 変数
PImage img; // イメージ
int grid = 10; // グリッドの単位

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  frameRate(60);
  img = loadImage("animals-q-c-960-540-4.jpg"); // 画像の読み込み
  rectMode(CENTER); // 矩形の描画の起点を中心に
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0); // 背景を黒に
  noStroke(); // 線の色をナシに
  //
  for (int y = 0; y <= img.height; y+= grid) {
    for (int x = 0; x <= img.width; x+= grid) {
      color c = img.get(x, y);
      float value = map(brightness(c), 0, 100, 0f, TWO_PI);
      float sin_value = map(sin(value+ frameCount*0.01), -1, 1, -grid, grid);
      fill(c);
      pushMatrix();
      translate(x, y-sin_value);
      rotate(-PI/4);
      rect(0, 0, grid, sin_value);
      popMatrix();
    }
  }
}
