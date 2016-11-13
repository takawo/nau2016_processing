// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(184, 52, 38);
  translate(width/2, height/2);
  rotate(frameCount*0.005);

  float r = 250;
  float step = 0;
  for (float angle = 0; angle < 360; angle += 2) {
    float theta = radians(angle);
    float x = cos(theta) * r;
    float y = sin(theta) * r;

    pushMatrix();
    translate(x, y);
    stroke(0, 1, 50);
    point(0, 0);
    rotate(-theta + step + frameCount*0.01);
    line(0, 0, 0, 50);
   
    noStroke();
    fill(0, 0, 100);
    ellipse(0, 50, 10, 10);
    //ellipse(0,0,3,3);
    popMatrix();
    step += TWO_PI*(18/360f);
  }
}