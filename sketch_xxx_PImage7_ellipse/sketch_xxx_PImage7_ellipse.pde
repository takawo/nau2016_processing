PImage img;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  img = loadImage("city-q-c-960-540-3.jpg");
  background(0, 0, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  for (int i = 0; i < 50; i++) {
    int x = (int)random(img.width);
    int y = (int)random(img.height);
    color c = img.get(x, y);
    float hue = map(hue(c), 0f, 360f, 0, 1.0);
    float saturation = map(saturation(c), 0f, 100f, 0, 1.0);
    float brightness = map(brightness(c), 0f, 100f, 0, 1.0);
    float normal = (hue + saturation + brightness)/3f;
    float radius = map(normal,0f,1f,5,1);
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(c);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
}