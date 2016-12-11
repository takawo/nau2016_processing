float minHue = 180;
float maxHue = 360;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  translate(width/2, height/2);
  float grid = 10;
  for (float frame = 0; frame <= 960; frame += grid) {
    for (float x = -frame; x <= frame; x+= grid) {
      float y = -frame/2;
      float size = noise(x*0.01, (y+frameCount)*0.01)*height/10;

      float hue = map(x, 0, width, minHue, maxHue);
      float saturation = map(y, 0, height, 50, 100);
      fill(hue, saturation, 80);
      stroke(0, 0, 100);

      rect(x, y, grid, size);

      y = frame/2;
      size = noise(x*0.01, (y+frameCount)*0.01)*height/10;

      hue = map(x, 0, width, minHue, maxHue);
      saturation = map(y, 0, height, 50, 100);
      fill(hue, saturation, 80);
      stroke(0, 0, 100);

      rect(x, y, grid, -size);
    } 
    for (float y = -frame/2; y <= frame/2; y+= grid) {
      float x = -frame/2;
      float size = noise(x*0.01, (y+frameCount)*0.01)*height/10;

      float hue = map(x, 0, width, minHue, maxHue);
      float saturation = map(y, 0, height, 50, 100);
      fill(hue, saturation, 80);
      stroke(0, 0, 100);

      rect(x, y, size, grid);

      x = frame/2;
      size = noise(x*0.01, (y+frameCount)*0.01)*height/10;

      hue = map(x, 0, width, minHue, maxHue);
      saturation = map(y, 0, height, 50, 100);
      fill(hue, saturation, 80);
      stroke(0, 0, 100);


      rect(x-size, y, size, grid);
    }
  }
}