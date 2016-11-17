// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  //ortho / frustum(左、右、下、上、近い面までの距離、遠い面までの距離);
  ortho(-width/2, width/2, -height/2, height/2); // Same as ortho()
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(145, 60, 35);
  lights();

  pushMatrix();
  translate(width/2, height/2, -500);
  rotateX(-PI/3 + frameCount*0.01);
  rotateY(PI/4);
  noFill();
  strokeWeight(3);
  stroke(195, 80, 80);
  box(100);
  popMatrix();
}
