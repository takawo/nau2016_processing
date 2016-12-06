float cornerNum;

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
  for (float r = 50; r < 250; r += 2) {
    rotate(PI/-40);
    pushMatrix();
    float p = map(sin((frameCount+r)*0.005), -1, 1, -PI/2, PI/2);
    rotate(p);
    cornerNum = map(r, 50, 250, 8, 3);
    float startAngle = map(r, 50, 250, 0, 360);
    noFill();
    stroke(220, 100, 100, 100);
    strokeWeight(1.5);
    beginShape();
    for (float angle = startAngle; angle < 360+startAngle; angle += 360/cornerNum) {
      float theta = radians(angle);
      float x = cos(theta) * r;
      float y = sin(theta) * r;
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  //noLoop();
}

void mousePressed() {
  redraw();
}