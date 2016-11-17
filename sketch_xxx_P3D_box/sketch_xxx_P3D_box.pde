// color reference : https://goo.gl/J0T8H7
// setup関数 : 初回1度だけ実行される
ArrayList<Box> boxes = new ArrayList<Box>();
int num = 500;
int worldSize = 500;

void setup() {
  //fullScreen(P3D);
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < num; i++) {
    float rx = (random(1)+random(1)+random(1)+random(1)+random(1))/5;
    float ry = (random(1)+random(1)+random(1)+random(1)+random(1))/5;
    float rz = (random(1)+random(1)+random(1)+random(1)+random(1))/5;
    float x = map(rx, 0, 1, -worldSize, worldSize);
    float y = map(ry, 0, 1, -worldSize, worldSize);
    float z = map(rz, 0, 1, -worldSize, worldSize);
    float size = random(10, 50);
    Box b = new Box(x, y, z, size);
    boxes.add(b);
  }
  hint(ENABLE_DEPTH_TEST);
  noStroke();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(206, 72, 47);
  float depth = map(sin(frameCount*0.003), -1, 1, -worldSize, worldSize);
  lights();
  ambientLight(0, 0, 20);
  translate(width/2, height/2, depth);
  rotateY(map(sin(frameCount*0.005), -1, 1, PI, -PI));
  rotateZ(map(cos(frameCount*0.001), -1, 1, PI, -PI));
  for (Box b : boxes) {
    b.update();
    b.display();
  }
}

class Box {
  float x;
  float y;
  float z;
  float thetaX;
  float thetaY;
  float thetaZ;
  float stepX;
  float stepY;
  float stepZ;
  float size;
  float boxWidth;
  float boxHeight;
  float boxDepth;
  color c;
  color color1;
  color color2;
  Box(float _x, float _y, float _z, float _size) {
    color1 = color(186, 87, 64);
    color2 = color(32, 90, 100);
    c = lerpColor(color1, color2, random(1));
    x = _x;
    y = _y;
    z = _z;
    size = _size;
    thetaX = random(TWO_PI);
    thetaY = random(TWO_PI);
    thetaZ = random(TWO_PI);
    boxWidth = random(size/10, size);
    boxHeight = random(size/10, size);
    boxDepth = random(size/10, size);
    float stepSeed = map((boxWidth + boxHeight + boxDepth), 0, size*3, TWO_PI/100f, TWO_PI/600f);
    stepX = random(stepSeed);
    stepY = random(stepSeed);
    stepZ = random(stepSeed);
  }
  void update() {
    thetaX += stepX;
    thetaY += stepY;
    thetaZ += stepZ;
  }
  void display() {
    pushMatrix();
    translate(x, y, z);
    rotateX(thetaX);
    rotateY(thetaY);
    rotateZ(thetaZ);
    fill(c);
    box(boxWidth, boxHeight, boxDepth);
    popMatrix();
  }
}
