PImage img;
PImage sortedImg;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(400, 200); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  img = loadImage("lena_color_sm.jpg");
  sortedImg = img.get();
  sortedImg.loadPixels();

  for (int i = 0; i < sortedImg.pixels.length; i++) {
    float record = -1;
    int selectedPixel = i;

    for (int j = i; j < sortedImg.pixels.length; j++) {
      color c = sortedImg.pixels[j];
      float b = brightness(c);
      if (b > record) {
        selectedPixel = j;
        record = b;
      }
    }
    color temp = sortedImg.pixels[i];
    sortedImg.pixels[i] = sortedImg.pixels[selectedPixel];
    sortedImg.pixels[selectedPixel] = temp;
  }
  sortedImg.updatePixels();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0);
  image(img, 0, 0);
  translate(200, 0);
  image(sortedImg, 0, 0);
  saveFrame("sortedImg_img.png");
  noLoop();
}