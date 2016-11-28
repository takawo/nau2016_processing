ArrayList<PVector> points = new ArrayList<PVector>();
int num = 1500;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < num; i++) {
    float theta = random(TWO_PI);
    float r = random(200, 400);
    float n = (random(1) + random(1) + random(1) +random(1) + random(1)) / 5f;
    float x = cos(theta) * r;
    float y = sin(theta) * r;
    float z = map(n, 0, 1, -200, 200);
    points.add(new PVector(x, y, z));
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  lights();
  stroke(220, 80, 100, 40);
  strokeWeight(2);
  translate(width/2, height/2, -500);
  rotateY(frameCount*0.01);
  rotateZ(frameCount*0.003);
  for (PVector p : points) {
    for (PVector q : points) {
      if (!p.equals(q)) {
        float dist = p.dist(q);
        if (dist < 50) {
          line(p.x, p.y, p.z, q.x, q.y, q.z);
        }
      }
    }
  }
}