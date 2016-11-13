int imageNum = 10;
PImage images[] = new PImage[imageNum];
int currentNum = 0;

PImage img;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < imageNum; i++) {
    images[i] = loadImage("city-q-c-960-540-" + i + ".jpg");
  }
  background(0, 0, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  for (int i = 0; i < 1000; i++) {
    int x = (int)random(images[currentNum].width);
    int y = (int)random(images[currentNum].height);
    color c = images[currentNum].get(x, y);
    float hue = map(hue(c), 0f, 360f, 0, 1.0);
    float saturation = map(saturation(c), 0f, 100f, 0, 1.0);
    float brightness = map(brightness(c), 0f, 100f, 0, 1.0);
    float normal = pow((hue + saturation + brightness)/3f,3);
    float radius = map(normal, 0f, 1f, 5, .1);
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(c);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
  if (frameCount%500==0) {
    currentNum = (currentNum+1)%imageNum;
    //background(0, 0, 100);
  }
}

void mousePressed() {
  currentNum = (currentNum+1)%imageNum;
  //background(0, 0, 100);
}
