import geomerative.*;
RFont font;
String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
String[] strings = new String[str.length()];
int stringNum;
float rotateNum = random(TWO_PI, TWO_PI*3);
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < str.length(); i++) {
    strings[i] = str(str.charAt(i));
  }
  stringNum = (int)(random(strings.length));

  RG.init(this);
  RCommand.setSegmentLength(1);
  font = new RFont("FreeSans.ttf", 400, RFont.CENTER);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  RGroup group = font.toGroup(strings[stringNum]);
  RPoint center = group.getCenter();
  RPoint[] points = group.getPoints();
  translate(width/2, height/2+120);
  noStroke();
  fill(0, 0, 80, 90);
  font.draw(strings[stringNum]);
  fill(0, 0, 0);
  int i = 0;
  float r = 200;
  int max = points.length;
  for (RPoint p : points) {
    float theta = map(i, 0, max, 0, rotateNum);
    //ellipse(p.x, p.y, 3, 3);
    float x0 = p.x;
    float y0 = p.y;
    float x3 = center.x + cos(theta) * r;
    float y3 = center.y + sin(theta) * r;
    float x1 = x0;
    float y1 = y0;
    float nx = sin(frameCount*0.052)*10f * map(noise(x0/50f, y0/30f, frameCount/100f), 0f, 1f, -1, 1);
    float ny = cos(frameCount*0.033)*10f * map(noise(x3/30f, y3/50f, frameCount/100f), 0f, 1f, -1, 1);
    float x2 = lerp(x0+nx, x3, 0.5);
    float y2 = lerp(y0+ny, y3, 0.5);
    stroke(0, 0, 0, 10);
    strokeWeight(0.5);
    curve(x0, y0, x1, y1, x2, y2, x3, y3);
    i++;
  }
  if (frameCount%50 == 0) {
    stringNum = (int)(random(strings.length));
    println(strings[stringNum]);
    rotateNum = random(TWO_PI, TWO_PI/2);
  }
}