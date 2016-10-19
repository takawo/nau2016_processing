PImage img;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100);
  noStroke();
  img = loadImage("lena_color.jpg"); //画像を読み込み
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // 画像を表示
  image(img, 20, 20);
}