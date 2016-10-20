// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBの色指定に
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {

  background(0, 0, 80);
  translate(0, height/2);

  noStroke();
  fill(220, 80, 100);

  beginShape();
  for (float x = 0; x <= width; x += 1) {
    float y = -noise(x*0.003, frameCount*0.01)*100;
    vertex(x, y);
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}