// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P2D); // ウィンドウサイズを960px,540pxに
  //blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  translate(width/2, height/2);
  rotate(frameCount*0.01);
  for (float i = 0; i < 600; i++) {
    rotate(PI * 700f/400f/60f);
    strokeWeight((mouseX*1.5+width/2)/width*i/12);
    stroke(map(i, 0, 600, 150, 220), map(i, 0, 300, 50, 100), 100, 50);
    line(0, i*50f, 0, i);
  }
}