// 類似色の算出方法
int num = 5;
color[] colors = new color[num];
float size;
float offset = 100;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  frameRate(60);
  rectMode(CENTER);
  size = (width-offset*2)/num;
  //println(size);
  initColor();
}

void initColor(){
  float baseAngle = random(TWO_PI);
  float baseBrightness = random(30, 90);
  float baseSaturation = random(50, 95);
  float incAngle = random(PI/20, PI/5);
  float startAngle = baseAngle - incAngle * 2;
  println("//");
  for (int i = 0; i < num; i++) {
    float n = abs(cos((float)i/num*PI));
    float hue = degrees(startAngle + incAngle * i)%360;
    float saturation = baseSaturation + n*10f;
    float brightness = baseBrightness + n*5f;
    //println(hue, brightness, saturation);
    colors[i] = color(hue, brightness, saturation);
    println("color c" + i + " = new color(" + (int)hue + ", " + (int)brightness + ", " + (int)saturation + ");");
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  noStroke();
  translate(width/2, height/2, -300);
  ambientLight(0, 0, 100);
  lights();
  for (int i = 0; i < num; i++) {
    float m = map(i, 0, num-1, -num/2f, num/2f);
    pushMatrix();
    translate(size*m, 0, 0);
    rotateX(frameCount*TWO_PI/240);
    fill(colors[i]);
    box(size);
    popMatrix();
  }
}


void mousePressed(){
  initColor();
}
