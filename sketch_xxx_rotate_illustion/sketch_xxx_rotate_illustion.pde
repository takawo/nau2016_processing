float minRadius = 0;
float maxRadius = 1000;
float incRadius = 3;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  translate(width/2, height/2);
  rotate(frameCount*0.1);
  noStroke();
  int count = 0;
  for (float r = maxRadius; r > minRadius; r -= incRadius) {
    float theta = -frameCount*0.015 + map(r, minRadius, maxRadius, 0, TWO_PI*4); 
    float x = cos(theta) *r;
    float y = sin(theta) *r;
    if (count %2 == frameCount%2) {
      fill(0, 0, 100);
    } else {
      fill(0, 0, 0);
    }
    ellipse(x, y, r, r);
    count++;
  }
}