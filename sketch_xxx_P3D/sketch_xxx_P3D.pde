float rotateAngle = 0;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSB 色空間
  sphereDetail(8);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // 背景色を黒で描画
  background(0, 0, 0);
  // 原点座標を画面中央に移動 (x,y,z)
  translate(width/2, height/2, -300);
  // Y軸を中心に回転
  rotateY(frameCount*0.01);

  noFill();
  stroke(0, 0, 100);

  sphere(100);


  pushMatrix();
  translate(0,0,-350);
  box(100);
  popMatrix();

  pushMatrix();
  translate(0,0,350);
  sphere(100);
  popMatrix();
}
