ArrayList<Point> points = new ArrayList<Point>();
int num = 1500;
float minR = 300;
float maxR = 600;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < num; i++) {
    float theta = random(TWO_PI);
    float r = random(minR, maxR);
    points.add(new Point(theta, r));
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  lights();
  ambientLight(0,0,30);
  stroke(220, 80, 100, 65);
  strokeWeight(2.0);
  translate(width/2, height/2, -(minR+maxR)/1.5);
  rotateX(frameCount*0.003);
  rotateY(frameCount*0.004);
  rotateZ(frameCount*0.001);
  for (Point p : points) {
    p.update();
    for (Point q : points) {
      if (!p.pos.equals(q.pos)) {
        float dist = p.pos.dist(q.pos);
        if (dist < 70) {
          strokeWeight(map(dist,0,70,10,1.0));
          line(p.pos.x, p.pos.y, p.pos.z, q.pos.x, q.pos.y, q.pos.z);
        }
      }
    }
  }
}
