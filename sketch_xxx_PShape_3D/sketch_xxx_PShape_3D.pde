PShape shape;
float f;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  shape = loadShape("cow-nonormals.obj");
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  lights();
  translate(width/2, height/2);
  rotateX(PI);
  rotateY(f);
  scale(50);
  shape(shape, 0, 0);
  f += 0.01;
}