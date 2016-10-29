float freq;
float amp;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBの色指定に
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  translate(0, height/2);

  freq = map(mouseX, 0, 960, 0.001, 0.15);
  amp = map(mouseY, 0, height, 200, 100);
  stroke(0, 0, 0);
  line(0, 0, width, 0);
  float y = 0;
  float px = 0;
  float py = 0;
  stroke(220, 80, 100);
  for (float x = 0; x < width; x += 1) {
    y = sin((x+frameCount)*freq)*amp;
    line(x, y, px, py);
    px = x;
    py = y;
  }
}
