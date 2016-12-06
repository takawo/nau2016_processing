float grid = 1;
ArrayList colors = new ArrayList();

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (float x = 0; x <= width; x+= grid) {
    float hue = map(x, 0, width, 0, 90);
    color c1 = color(hue, 80, 100);
    color c2 = color((hue+180)%360, 80, 100);
    if (hue <(hue+180)%360) {
      colors.add(c1);
      colors.add(c2);
    } else {
      colors.add(c2);
      colors.add(c1);
    }
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  int i = 0;
  for (float x = 0; x <= width; x+= grid) {
    for (float y = 0; y < height; y+= 1) {
      color c1 = (color)colors.get(i);
      color c2 = (color)colors.get(i+1);
      float n = map(y, 0, height, 0, 1.0);
      color c = lerpColor(c1, c2, n);
      stroke(c);
      strokeWeight(grid);
      strokeCap(PROJECT);
      line(x+grid/2, y, x+grid/2, y+grid);
    }
    i+=2;
  }
}