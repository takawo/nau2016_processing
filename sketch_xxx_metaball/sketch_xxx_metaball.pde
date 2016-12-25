ArrayList<Blob> blobs = new ArrayList<Blob>();
int num = 5;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < num; i++) {
    Blob b = new Blob(random(width), random(height));
    blobs.add(b);
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float sum = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y); 
        sum += 200 * b.r / d;
      }
      pixels[index] = color(sum, 80, 100);
    }
  }
  updatePixels();
  for (Blob b : blobs) {
    b.update();
  }
}