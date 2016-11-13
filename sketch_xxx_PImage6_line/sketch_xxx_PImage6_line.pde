PImage img;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  img = loadImage("city-q-c-960-540-3.jpg");
  background(0,0,100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  for (int i = 0; i < 10; i++) {
    int x = (int)random(img.width);
    int y = (int)random(img.height);
    color c = img.get(x,y);
    float angle = hue(c);
    float theta = radians(angle);
    pushMatrix();
    translate(x,y);
    rotate(theta);
    stroke(c);
    strokeWeight(2);
    line(0,0,30,0);
    popMatrix();
  }
}