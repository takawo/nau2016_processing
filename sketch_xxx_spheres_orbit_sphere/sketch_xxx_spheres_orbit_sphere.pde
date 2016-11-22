float r = 300;
int num =100;
ArrayList<Point> points = new ArrayList<Point>();
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  //blendMode(ADD);
  smooth(); // 描画を滑らかに
  sphereDetail(8);
  for (float i = 0; i < num; i++) {
    float thetaA = random(TWO_PI);
    float thetaB = random(-PI, PI);
    points.add(new Point(thetaA, thetaB, r));
  }
  background(0, 0, 0);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  hint(DISABLE_DEPTH_TEST);
  fill(0, 0, 0, 100);
  noStroke();
  rect(0, 0, width, height);
  hint(ENABLE_DEPTH_TEST);
  lights();
  ambientLight(0, 50, 20);
  float n = sin(frameCount*0.005);
  float fov = map(n, -1, 1, 0.75, 1.0);  //視野角
  //perspective(視野角、縦横の比率、近い面までの距離、遠い面までの距離)
  perspective(fov, float(width)/float(height), 1, 2000.0);

  translate(width/2, height/2, -300);
  rotateZ(-PI/6);
  rotateX(frameCount*0.003);
  rotateY(-frameCount*0.005);
  stroke(220, 80, 100, 100);
  noFill();
  sphereDetail(8);
  sphere(300);
  //sphereDetail(4);
  for (Point p : points) {
    p.update();
    p.display();
  }
}

class Point {
  float thetaA;
  float thetaB;
  float targetA;
  float targetB;
  float r;
  PVector pos;
  color c;
  float size;
  float easing;
  Point(float _thetaA, float _thetaB, float _r) {
    thetaA = _thetaA;
    thetaB = _thetaB;
    r = _r;
    float x = cos(thetaA) * r * sin(thetaB);
    float y = sin(thetaA) * r* sin(thetaB);
    float z = cos(thetaB) * r;
    pos = new PVector(x, y, z);
    targetA = random(TWO_PI);
    targetB = random(-PI, PI);
    c = color(0, 0, 100);
    size = 5;
    easing = map(dist(thetaA, thetaB, targetA, targetB), 0, sqrt(TWO_PI*TWO_PI), 0.0001, 0.01);
  }
  void update() {
    thetaA = lerp(thetaA, targetA, easing);
    thetaB = lerp(thetaB, targetB, easing);
    float x = cos(thetaA) * r * sin(thetaB);
    float y = sin(thetaA) * r* sin(thetaB);
    float z = cos(thetaB) * r;
    pos = new PVector(x, y, z);
    if (dist(thetaA, thetaB, targetA, targetB)< 3f/360f*TWO_PI) {
      thetaA = targetA;
      thetaB = targetB;
      targetA = random(TWO_PI);
      targetB = random(-PI, PI);
    }
    c = color(degrees(thetaA+thetaB)/2.0, 80, 100, 100);
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(c);
    noStroke();
    sphere(size);
    popMatrix();
  }
}