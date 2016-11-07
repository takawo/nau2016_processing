float x;
float y;
float ty;
float diameter;
float offset;
float easing = 0.1;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  diameter = 50;
  offset = diameter;

  x = width/2;
  y = random(offset, height-offset);
  ty = random(offset, height-offset);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);

  fill(0, 0, 50);
  noStroke();
  ellipse(x, y, diameter, diameter);

  noFill();
  stroke(0, 0, 20);
  strokeWeight(3);
  ellipse(x, ty, diameter, diameter);

  y = lerp(y, ty, easing);
  if (abs(ty-y) < 0.1) {
    y = ty;
    ty = random(offset, height-offset);
  }
}
