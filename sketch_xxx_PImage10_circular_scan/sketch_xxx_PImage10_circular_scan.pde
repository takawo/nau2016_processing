PImage img;
ArrayList<Float> thetas = new ArrayList<Float>();
// setup関数 : 初回1度だけ実行される
void setup() {
  size(512, 512);
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  img = loadImage("lena_color.jpg");
  for (int r = 10; r < width; r += 10) {
    thetas.add(map(r,10,width,0,PI));
  }
  background(0, 0, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  int i = 0;
  for (int r = 10; r < width; r += 10) {
    float theta = thetas.get(i);
    int x = int(cos(theta) * r + width/2);
    int y = int(sin(theta) * r + height/2);
    color c = img.get(x, y);
    float b = brightness(c);
    float radius = map(b, 0, 100, 5, 0);
    noStroke();
    fill(c);
    ellipse(x, y, radius, radius);
    thetas.set(i, theta+0.01);
    i++;
  }
}
