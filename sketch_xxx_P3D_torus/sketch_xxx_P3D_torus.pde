// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  noStroke();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(227, 20, 24);
  fill(212,85,80);
  lights();
  translate(width/2, height/2, -700);
  rotateY(frameCount*0.01);
  rotateZ(PI/4*sin(frameCount*0.003));
  float r = 300;
  for (float angle = 0; angle < 360; angle += 10) {
    float theta = radians(angle);
    float x = cos(theta)*r;
    float y = 0;
    float z = sin(theta)*r;
    pushMatrix();
    translate(x, y, z);
    rotateY(-theta);
    rotateZ(frameCount*0.01);
    float r2 = 130;
    for(float angle2 = 0; angle2 < 360; angle2 += 45){
      float theta2 = radians(angle2);
      float t = cos(theta2)* r2;
      float s = sin(theta2)* r2;
      pushMatrix();
      translate(t,s,0);
      rotateX(-frameCount*0.01);
      box(5);
      popMatrix();
    }
    //box(20);
    popMatrix();
  }
}
