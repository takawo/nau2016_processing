// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  translate(width/2, height/2);
  noFill();
  float n = 100;
  float r = 250;
  for (int k = 0; k < 1; k++) {
    for (float i = 0; i < n; i++) {
      float theta1 = map(i, 0, n, 0, TWO_PI);
      float x1 = cos(theta1) * r;
      float y1 = sin(theta1) * r;
      fill(0, 0, 0);
      noStroke();
      ellipse(x1, y1, 5, 5);
      noFill();
      float j = (int)random(n);
      while (j==i) {
        j = (int)random(n);
      }
      float theta2 = map(j, 0, n, 0, TWO_PI);
      float x2 = cos(theta2) * r;
      float y2 = sin(theta2) * r;

      float atan2 = 0;
      float atanA = atan2(y2-y1, x2-x1)+PI/2;
      float atanB = atan2(y2-y1, x2-x1)-PI/2;
      float distA = dist((x1+x2)/2 + cos(atanA)*100, (y1+y2)/2 + sin(atanA)*100, 0, 0);
      float distB = dist((x1+x2)/2 + cos(atanB)*100, (y1+y2)/2 + sin(atanB)*100, 0, 0);
      if (distA > distB) {
        atan2 = atanB;
      } else {
        atan2 = atanA;
      }
      float r2 = random(r/10,r);
      float x3 = x1+cos(atan2)*r2;
      float y3 = y1+sin(atan2)*r2;
      float x4 = x2+cos(atan2)*r2;
      float y4 = y2+sin(atan2)*r2;
      float dist = dist(x1, y1, x2, y2);
      float sw = map(dist, 0, r*2, 10, 3);
      strokeWeight(sw);
      strokeCap(MITER);
      stroke(random(180,220), 80, 100, 50);
      bezier(x1, y1, x3, y3, x4, y4, x2, y2);
    }
  }
  noLoop();
}

void mousePressed() {
  redraw();
}