// setup関数 : 初回1度だけ実行される
void setup() {
  size(500, 500); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  rectMode(CENTER);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  noFill();
  stroke(0, 0, 100);
  translate(width/2, height/2);
  float grid = 50;
  int i = 0;
  for (float size = height-frameCount%grid; size >= 0; size -= grid) {
    strokeWeight(10-i);
    rect(0, 0, size, size);
    i++;
  }
}