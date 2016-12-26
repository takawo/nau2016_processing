// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}
float size = 500;
// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(220, 50, 100);
  translate(width/2, height/2+150+sin(frameCount*0.01)*50);
  rotateX(PI/2.3+cos(frameCount*0.01)*PI/10);
  lights();
  float grid = 10;
  //stroke(0, 0, 100);
  noStroke();
  float offset = 500;
  for (float y = -size; y < size; y += grid) {
    beginShape(TRIANGLE_STRIP);
    for (float x = -size*2; x < size*2; x += grid/2) {
      float alpha = map(y, -size, -size/2, 0, 100);
      float z1 = noise((x+offset)/100f, (y+offset-frameCount*grid)/100f)*150;
      fill(map(z1, 0, 150, 80, 120), 50, 80, alpha);      
      vertex(x, y, z1);
      float alpha2 = map(y+grid, -size, -size/2, 0, 100);
      float z2 = noise((x+offset)/100f, (y+offset+grid-frameCount*grid)/100f)*150;
      fill(map(z2, 0, 150, 80, 120), 50, 80, alpha2);
      vertex(x, y+grid, z2);
    }
    endShape();
  }
}