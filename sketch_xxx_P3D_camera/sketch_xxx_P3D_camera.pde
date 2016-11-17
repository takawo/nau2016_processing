// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(145, 60, 35);
  lights();

  pushMatrix();
  translate(width/2, height/2, -500);
  noFill();
  strokeWeight(3);
  stroke(195,80,80);
  //camera(視点X, 視点Y, 視点Z, 中心点X, 中心点Y, 中心点Z, 天地X, 天地Y, 天地Z);
  camera(150.0, -200.0, 250.0, 0, 0, 0.0, 0.0, 1.0, 0.0);
  rotateX(-PI/3);
  rotateY(PI/4 + frameCount*0.01);
  box(100);
  popMatrix();
}
