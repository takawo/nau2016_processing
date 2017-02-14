float grid = 30;
color[] palette;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(8); // 描画を滑らかに
  palette = minard;
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  fill(palette[0], 50);
  rect(0, 0, width, height);
  randomSeed(100);
  for (float y = 0; y < height; y += grid) {
    for (float x = 0; x < width; x += grid) {
      pushMatrix();
      translate(x+grid/2, y+grid/2);
      float start_theta = random(TWO_PI);
      float end_theta = random(TWO_PI);
      float freq = map(abs(start_theta-end_theta), 0, TWO_PI, 0.1, 0.001);
      float sw = map(abs(start_theta-end_theta), 0, TWO_PI, 2, 1);
      float margin = random(grid/8, grid/4);
      int cNum = (int)random(1, palette.length);
      color c = palette[cNum];
      if (random(1) < 0.5) {
        freq *= -1;
      }
      float temp_theta = 0;
      float diameter =grid;
      if (start_theta > end_theta) {
        temp_theta = end_theta;
        end_theta = start_theta;
        start_theta = temp_theta;
      }
      rotate(frameCount*freq);
      noFill();
      stroke(palette[cNum]);
      strokeWeight(sw);
      int n = (int)random(2, 5);
      for (int i = 0; i < n; i++) {
        arc(0, 0, diameter-(margin*i), diameter-(margin*i), start_theta, end_theta);
        if (abs(start_theta-end_theta) < PI) {
          arc(0, 0, diameter-(margin*i), diameter-(margin*i), start_theta+PI, end_theta+PI);
        }
      }
      popMatrix();
    }
  }
}