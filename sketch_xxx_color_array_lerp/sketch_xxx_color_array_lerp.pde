float grid = 1;
color[] palette;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}
// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  noStroke();
  palette = chemistry;
  for (float x = 0; x < width; x += grid) {
    float t = map(x, 0, width, 0, palette.length-1);
    int u = (int) t;
    float v = t%1;
    color c = lerpColor(palette[u], palette[u+1], v);
    fill(c);
    rect(x, 0, grid, height);
  }
}