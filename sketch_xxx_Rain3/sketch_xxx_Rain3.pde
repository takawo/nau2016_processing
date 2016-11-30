float r = 250;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P2D); // ウィンドウサイズを960px,540pxに
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  translate(width/2, height/2);
  for (float r = 25; r < 250; r += 30) {
    for (float angle = 0; angle < 360; angle+=1) {
      float theta = radians(angle);
      float x = cos(theta) * r;
      float y = sin(theta) * r;
      noStroke();
      fill(map(r, 50, 250, 260, 190), 80, 100, 12);
      float n = noise(x/100f, y/100f, (angle+frameCount)/200f);
      n = map(norm(n, 0, 0.30), 0, 1.0, 0, 41);
      ellipse(x, y, n, n);
    }
  }
}
