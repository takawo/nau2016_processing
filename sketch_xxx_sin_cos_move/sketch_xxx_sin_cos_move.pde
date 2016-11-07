// reference: https://www.openprocessing.org/sketch/387908

float num = 600;
float frms = 60;
float z = 15;
float angle = 0;
float theta = 0;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  noStroke();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 95);

  translate(width/2, height/2);
  rotate(-frameCount*0.005);
  float h = height*3/4;
  for (int i = 0; i < z; i++) {
    float f = (i%2 == 0)? 95 : 10;
    drawThing(h - (h*.95 / z * i), f, i);
  }
  theta += TWO_PI/frms;
}

void drawThing(float diam, float col, float n) {
  fill(0,0,col);
  beginShape();
  float d = 0;
  for (float i = 0; i < num; i++) {
    float offSet = PI / z * n;
    float angle = TWO_PI / num * i;
    float s = 0.7 + 0.4 * sin(sq(offSet) + theta + angle * 4.0);
    d = 0.25 + 0.2 * pow(s, 0.4);
    d += 0.08 * pow(0.5 + 0.5 + cos(4 * angle), 0.8);
    float x = cos(angle) * d * diam;
    float y = sin(angle) * d * diam;
    vertex(x, y);
  }
  endShape(CLOSE);
}
