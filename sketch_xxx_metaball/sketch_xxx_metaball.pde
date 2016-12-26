ArrayList<Blob> blobs = new ArrayList<Blob>();
int num = 5;
// setup関数 : 初回1度だけ実行される
void setup() {
  //size(960, 540); // ウィンドウサイズを960px,540pxに
  fullScreen(P2D);
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < num; i++) {
    Blob b = new Blob(random(width), random(height));
    blobs.add(b);
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0,0,100);

  loadPixels();
  int index = 0;
  float sum = 0;
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      index = x + y * width;
      sum = 0;
      for (Blob b : blobs) {
        //float d = ;
        sum += 25 * b.r / dist(x, y, b.pos.x, b.pos.y);
      }
      pixels[index] = color(0,0, 100-sum);
    }
  }
  updatePixels();
  for (Blob b : blobs) {
    b.update();
  }
}
