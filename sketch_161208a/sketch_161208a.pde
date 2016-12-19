// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  translate(width/2, height/2, -500);
  stroke(0, 0, 100);
  noFill();
  beginShape();
  for (int i = 0; i < 100; i++) {
    float x =  cos(i) * map(i, 0, 100, 0, 500);
    float y =  sin(i*5) * map(i, 0, 100, 0, 500);
    float z =  cos(map(noise(x+frameCount/100f,y+i/100f,+frameCount/100f), -1, 1, -PI, PI)) * map(i, 0, 100, 0, 500);
    curveVertex(x, y, z);
  }
  endShape();
}