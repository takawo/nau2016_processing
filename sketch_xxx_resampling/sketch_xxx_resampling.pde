PImage img;
PImage img_sm;
int grid = 10;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(512, 512); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  img = loadImage("lena_color.jpg");
  img_sm = img.copy();
  img_sm.resize(grid, grid);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  for (int y = 0; y < img.height; y+=grid) {
    for (int x = 0; x < img.width; x+=grid) {
      color c = img.get(x, y);
      tint(c);
      image(img_sm, x, y);
    }
  }
  noLoop();
}