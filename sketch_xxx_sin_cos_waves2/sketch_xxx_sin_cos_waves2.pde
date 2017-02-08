float r = 250;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  blendMode(ADD);
  translate(0, height/2);
  for (float x1 = -250; x1 < width; x1 += .5) {
    float theta1 = radians(x1+frameCount*2.5);
    float x2 = (x1+250)%(width+250);
    color c = color(map(x2, -250, width, 0, 360), 80, 100);
    stroke(c,80);
    float theta2 = radians(-frameCount*2.5);
    float y1 = pow(cos(theta1/4), 3)*pow(cos(theta2), 1)* r;
    float y2 = pow(sin(theta1), 1)*pow(sin(theta2/4), 3)* r;
    line(x1, y1, x2, y2);
  }
}