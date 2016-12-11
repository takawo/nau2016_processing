PImage img;
int grid = 10;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(1280, 720); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  img = loadImage("people-q-c-1280-720-5.jpg");
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  //image(img, 0, 0);
  for (int y = 0; y < img.height; y += grid) {
    for (int x = 0; x < img.width; x += grid) {
      color c = img.get(x, y);
      int a = c >> 24 & 0xFF;
      int r = c >> 16 & 0xFF;
      int g = c >> 8 & 0xFF;
      int b = c & 0xFF;
      //float brightness = brightness(c);
      float brightness = (r+g+b)/3f;
      float dot_separate = (int)map(brightness, 0, 255, 1, grid/2);
      if (dot_separate <= 1) {
        continue;
      }
      for (float j = 0; j < grid; j+= dot_separate) {
        for (float i = 0; i < grid; i+= dot_separate) {
          strokeWeight(2);
          point(x+i, y+j);
        }
      }
    }
  }
  noLoop();
}