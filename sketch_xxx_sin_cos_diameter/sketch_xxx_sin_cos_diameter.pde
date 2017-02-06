float t = 0;
// setup関数 : 初回1度だけ実行される
Easing easing;
void setup() {
  size(960, 540, P2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(8); // 描画を滑らかに
  easing = new EasingOutElastic();
}
float n = 50;
// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  translate(width/2, height/2);
  for (float y = -height/2; y < height/2; y += height/n) {
    for (float x = -width/2; x < width/2; x += width/n) {
      float value = min(height/n, width/n);
      pushMatrix();
      translate(x+value/2, y+value/2);
      noStroke();
      fill(0, 0, 0);
      float distance = dist(x, y, 0, 0);
      float theta = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 0, TWO_PI);
      theta = abs(theta -frameCount*0.05)%TWO_PI;
      float diameter = sin(theta) * value*2;
      color c = color(map(theta, 0, TWO_PI, 0, 360), 80, 100);
      fill(c);
      ellipse(0, 0, diameter, diameter);
      popMatrix();
    }
  }
}