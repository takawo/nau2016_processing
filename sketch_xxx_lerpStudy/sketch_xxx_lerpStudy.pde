float n = 4;
float l = 50;
//float r = 250;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  translate(width/2, height/2);
  rotate(-frameCount*0.001);
  for (float r = 100; r < 250; r += 5) {
    for (float angle = 0; angle < 360; angle += 360/n) {
      float theta1 = radians(angle);
      float theta2 = radians(angle + 360/n);
      float x1 = cos(theta1) * r;
      float y1 = sin(theta1) * r;
      float x2 = cos(theta2) * r;
      float y2 = sin(theta2) * r;
      beginShape();
      for (float m = 0; m < 1.0; m += 1.0/l) {
        float x = lerp(x1, x2, m);
        float y = lerp(y1, y2, m);
        float theta = atan2(y, x)-PI/4;
        pushMatrix();
        translate(x, y);
        rotate(theta);
        stroke(0, 0, 0);
        //line(0, 0, sin(theta*n+frameCount*TWO_PI/300)*50, 0);
        noStroke();
        fill(0, 0, 0);
        PVector pos = localToScreen(sin(theta*n+frameCount*TWO_PI/(l*n))*r/4, 0);
        vertex(pos.x-width/2,pos.y-height/2);
        popMatrix();
        noStroke();
      }
      endShape(CLOSE);
    }
  }
}

PVector screenToLocal(float x, float y) {
  PVector in = new PVector(x, y);
  PVector out = new PVector();
  PMatrix2D current_matrix = new PMatrix2D();
  getMatrix(current_matrix);
  current_matrix.invert();
  current_matrix.mult(in, out);
  return out;
}

PVector localToScreen(float x, float y) {
  PVector in = new PVector(x, y);
  PVector out = new PVector();
  PMatrix2D current_matrix = new PMatrix2D();
  getMatrix(current_matrix);
  current_matrix.mult(in, out);
  return out;
}
