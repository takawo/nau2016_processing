// setup関数 : 初回1度だけ実行される
float px = 0;
float py = 0;

void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  background(0, 0, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  fill(0, 0, 100, 5);
  rect(0, 0, width, height);
  strokeWeight(1);
  stroke(frameCount%360/10,80,50);
  translate(width/2, height/2);
  for (float i = 0; i < 2000; i+=5) {
    float angleX = (frameCount*5+i)/3f;
    float angleY = (frameCount*3+i)/5f;
    float thetaX = radians(angleX);
    float thetaY = radians(angleY);
    float radiusX = map(sin((i+frameCount)/100), -1, 1, 200, 450);
    float radiusY = map(cos(-(i+frameCount)/100), -1, 1, 200, 350);
    float x = cos(thetaX)*radiusX;
    float y = sin(thetaY)*radiusY;
    if (i != 0) {
      line(x, y, px, py);
    }
    px = x;
    py = y;
  }
}

// mouseMoved関数 : マウスがクリックされたときに実行される
void mouseMoved() {
}

// mousePressed関数 : マウスがクリックされたときに実行される
void mousePressed() {
}

// mouseReleased関数 : クリックが解放されたときに実行される
void mouseReleased() {
}

// mouseDraged関数 : マウスがドラッグされたときに実行される
void mouseDragged() {
}