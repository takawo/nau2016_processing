color[] palette;
float num = 3;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540);
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  palette = cottage;
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  randomSeed(0);
  float grid = width/num;
  for (float y = 0; y < height+grid; y += grid) {
    for (float x = 0; x < width+grid; x+= grid) {
      int i = (int)random(30);
      float r = grid*map(sin(frameCount*0.01),-1,1,1,sqrt(2)/2);
      pushMatrix();
      translate(x, y);
      rotate(frameCount*0.01);
      noStroke();
      fill(220, 50, 60);
      noStroke();
      fill(palette[i%palette.length]);
      i++;
      arc(0, 0, r/2, r/2, 0, PI/2);
      fill(palette[i%palette.length]);
      i++;
      arc(0, 0, r, r, PI/2, PI);
      fill(palette[i%palette.length]);
      i++;
      arc(0, 0, r/2, r/2, PI, PI*3/2);
      fill(palette[i%palette.length]);
      i++;
      arc(0, 0, r, r, PI*3/2, PI*2);
      fill(palette[i%palette.length]);
      i++;
      arc(-grid/2, -grid/2, r, r, 0, PI/2);
      fill(palette[i%palette.length]);
      i++;
      arc(-grid/2, +grid/2, r/2, r/2, PI*3/2, PI*2);
      fill(palette[i%palette.length]);
      i++;
      arc(+grid/2, -grid/2, r/2, r/2, PI/2, PI);
      fill(palette[i%palette.length]);
      i++;
      arc(+grid/2, +grid/2, r, r, PI, PI*3/2);
      popMatrix();
    }
  }
  //noLoop();
}

void mousePressed() {
  redraw();
}