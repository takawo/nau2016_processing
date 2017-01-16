float len = 100;
float n = 3;
float angle = 90/n;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 960); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  fill(0, 0, 0);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  translate(width/2, height/2);
  branch((int)n*2, len);
  rotate(PI);
  branch((int)n*2, len);
  noLoop();
}
void branch(int depth, float len) {
  if (depth <= 0) {
    return;
  }
  //strokeWeight(depth);
  line(0, 0, 0, -len);
  ellipse(0, -len, 3, 3);
  ellipse(0, 0, 3, 3);
  pushMatrix();
  translate(0, -len);
  branch(depth-1, len);
  popMatrix();
  float x1 = -len + cos(radians(-angle))*len;
  float y1 = 0 + sin(radians(-angle))*len;
  ellipse(x1, y1, 3, 3);
  noFill();
  //strokeWeight(depth);
  arc(-len, 0, len*2, len*2, radians(-angle), radians(0));
  pushMatrix();
  translate(x1, y1);
  rotate(radians(-angle));
  branch(depth-1, len);
  popMatrix();

  ellipse(0, 0, 3, 3);
  float x3 = +len + cos(radians(180+angle))*len;
  float y3 = 0 + sin(radians(180+angle))*len;
  ellipse(x3, y3, 3, 3);
  noFill();
  //strokeWeight(depth);
  arc(len, 0, len*2, len*2, radians(180+0), radians(180+angle));
  pushMatrix();
  translate(x3, y3);
  rotate(radians(angle));
  branch(depth-1, len);
  popMatrix();
}