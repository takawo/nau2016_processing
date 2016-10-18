// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100);
  strokeCap(ROUND);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  // 時の取得(0-24)
  float hour = hour();
  // 分の取得(0-59)
  float minute = minute();
  // 秒の取得(0-59)
  float second = second();
  // ミリ秒の取得(0-999)
  float millis = millis()%1000;

  float hAngle = map(hour+minute/60f, 0, 12, 0, TWO_PI);
  float mAngle = map(minute+second/60f, 0, 60, 0, TWO_PI);
  float sAngle = map(second, 0, 60, 0, TWO_PI);
  translate(width/2, height/2);
  rotate(TWO_PI*(-90f/360f));
  int i = 0;
  for (float theta = 0; theta < TWO_PI; theta += TWO_PI/60) {
    float x = cos(theta)*200;
    float y = sin(theta)*200;
    if (i%5 == 0) {
      strokeWeight(5);
    } else {
      strokeWeight(3);
    }
    point(x, y);
    i++;
  }
  float hx = cos(hAngle)*100;
  float hy = sin(hAngle)*100;
  strokeWeight(10);
  line(0, 0, hx, hy);
  float mx = cos(mAngle)*160;
  float my = sin(mAngle)*160;
  strokeWeight(5);
  line(0, 0, mx, my);
  float sx = cos(sAngle)*160;
  float sy = sin(sAngle)*160;
  strokeWeight(2);
  line(0, 0, sx, sy);

  fill(0, 0, 0);
  ellipse(0, 0, 15, 15);
}