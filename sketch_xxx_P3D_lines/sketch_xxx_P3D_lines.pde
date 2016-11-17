float r = 200;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  noFill();
  background(200, 30, 30);
  translate(width/2, height/2, -500);
  lights();
  rotateY(frameCount*0.01);
  rotateX(frameCount*0.003);
  beginShape();
  for (float angle = 0; angle < 360; angle += .1) {
    float theta1 = radians(angle);
    float theta2 = radians(angle+180);
    float x1 = cos(theta1) * r;
    float y1 = r*1.5;
    float z1 = sin(theta1) * r;
    float x2 = cos(theta2) * r;
    float y2 = -r*1.5;
    float z2 = sin(theta2) * r;
    //line(x1, y1, z1, x2, y2, z2);
    stroke(angle, 80, 100);
    vertex(x1, y1, z1);
    vertex(x2, y2, z2);
  }
  endShape(CLOSE);
}
