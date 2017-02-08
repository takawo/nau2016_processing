float minY = -2000;
float maxY = 2000;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  sphereDetail(8);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  lights();
  translate(width/2, height/2, -500);
  rotateX(frameCount*0.01);
  rotateY(frameCount*0.01);
  rotateZ(frameCount*0.003);
  for (float y = minY; y < maxY; y += 10) {
    float n = y-frameCount;
    float x1  = cos(n/100f)*250;
    float z1  = sin(n/100f)*250;
    float x2  = cos(n/100f+PI)*250;
    float z2  = sin(n/100f+PI)*250;
    color c1 = color(map(y, minY, maxY, 0, 360), 80, 100);
    color c2 = color(map(y, minY, maxY, 180, 540)%360, 80, 100);
    fill(c1);
    noStroke();
    pushMatrix();
    translate(x1, y, z1);
    sphere(10);
    popMatrix();
    pushMatrix();
    translate(x2, y, z2);
    sphere(10);
    popMatrix();
    stroke(c2);
    strokeWeight(3);
    line(x1, y, z1, x2, y, z2);
  }
}