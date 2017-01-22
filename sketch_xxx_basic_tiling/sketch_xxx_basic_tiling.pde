// setup関数 : 初回1度だけ実行される
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  noStroke();
  fill(220, 50, 60);
  float r = 250*sqrt(2);
  ellipse(width/2, height/2, r, r);
  ellipse(0, 0, r, r);
  ellipse(width, 0, r, r);
  ellipse(0, height, r, r);
  ellipse(width, height, r, r);
}