// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

void draw() {
  stroke(165, 70, 45);
  strokeWeight(5);
  noFill();
  background(0, 0, 100);
  float fov = radians(frameCount%360);  //視野角
  //perspective(視野角、縦横の比率、近い面までの距離、遠い面までの距離)
  perspective(fov, float(width)/float(height), 1.0, 1000.0);
  pushMatrix();
  translate(width/2, height/2, -100);  //基準点を画面中央。z軸方向には-100
  rotateX(radians(-20 + frameCount));
  rotateY(radians(frameCount));
  box(150);
  popMatrix();
}
