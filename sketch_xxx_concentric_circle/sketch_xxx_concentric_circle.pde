// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  translate(width/2, height/2);
  float r = 200;
  noFill();
  strokeWeight(1);
  stroke(0, 0, 100, 50);
  ellipse(0, 0, r*2, r*2);
  int i = 0;
  for (float angle =0; angle < 360; angle += 10) {
    float theta = radians(angle);
    float x1 = cos(theta) * r;
    float y1 = sin(theta) * r;
    float x2 = cos(theta + PI) * r;
    float y2 = sin(theta + PI) * r;
    strokeWeight(5);
    point(x1, y1);
    point(x2, y2);
    strokeWeight(1);
    line(x1, y1, x2, y2);
    float startN = 0;
    float endN = 1.0;
    if(i%2 == 0){
      startN = 0.05;
    }
    for (float n = startN; n < endN; n+= 0.1) {
      float x3 = lerp(x1, x2, n);
      float y3 = lerp(y1, y2, n);
      strokeWeight(5);
      point(x3, y3);
    }
    i++;
  }
}
