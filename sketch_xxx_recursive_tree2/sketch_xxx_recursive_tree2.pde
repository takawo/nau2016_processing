float len = 100;
float rad = 0;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  translate(width/2, height);
  rad = map(mouseX, 0, width, PI, TWO_PI);
  len = map(mouseY, 0, height, 100, 200);
  branch(8, len);
}

void branch(int depth, float len) {
  strokeWeight(depth);
  if (depth > 0) {
    line(0, 0, 0, -len);
    pushMatrix();
    translate(0, -len);
    branch(depth-1, len*0.8);
    pushMatrix();
    rotate(rad * 1/8);
    branch(depth-1, len*0.8);
    popMatrix();
    //pushMatrix();
    //rotate(rad * 2/8);
    //branch(depth-1, len*0.8);
    //popMatrix();
    pushMatrix();
    rotate(-rad * 1/8);
    branch(depth-1, len*0.8);
    popMatrix();
    //pushMatrix();
    //rotate(-rad * 2/8);
    //branch(depth-1, len*0.8);
    //popMatrix();
    popMatrix();
  }
}