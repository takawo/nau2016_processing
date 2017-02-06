int n = 100;
int m = 10;
float period = 120;
float amplitude;
float size = 10;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P2D); // ウィンドウサイズを960px,540pxに
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  amplitude = height/4;
  frameRate(30);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  translate(0, height/2);
  for (float i = 0; i < n+1; i++) {
    float x = map(i, 0, n, 0+size, width-size);
    for (float j = 0; j < m; j++) {
      float y1 = sin(map(j, 0, m, -PI/8, PI/8)+map(i, 0, n, 0, TWO_PI)+frameCount*TWO_PI/period)*amplitude;
      float y2 = cos(PI/2+map(j, 0, m, -PI/8, PI/8)+map(i, 0, n, 0, TWO_PI)+frameCount*TWO_PI/period)*amplitude;
      noStroke();
      float hue1 = map(y1, -amplitude, amplitude, 0, 180);
      float hue2 = hue1 + 180;
      fill(hue1, 80, 100, 70);
      ellipse(x, y1, size, size);
      fill(hue2, 80, 100, 70);
      ellipse(x, y2, size, size);
    }
  }
}