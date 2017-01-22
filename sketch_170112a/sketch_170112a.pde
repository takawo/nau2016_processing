ArrayList<PVector> pointA = new ArrayList<PVector>();
ArrayList<PVector> pointB = new ArrayList<PVector>();
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, FX2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}
float num = 6;
float r = 250;

// draw関数 : setup関数実行後繰り返し実行される
void draw() {

  for (float angle = 0; angle < 360; angle += 360/num) {
    float theta1 = radians(angle);
    float theta2 = radians(angle+360/num);
    float x1 = cos(theta1) * r; 
    float y1 = sin(theta1) * r;
    pointA.add(new PVector(x1, y1));
    float x2 = cos(theta2) * r; 
    float y2 = sin(theta2) * r;
    for (float i = 0; i < 1.0; i+= 1.0/5) {
      float r2 = map(sin(frameCount*0.05), -1, 1, r-r*1/3, r+r*1/3);
      float x3 = cos(lerp(theta1, theta2, i))*r2;
      float y3 = sin(lerp(theta1, theta2, i))*r2;
      pointB.add(new PVector(x3, y3));
    }
  }
  background(0, 0, 100);
  translate(width/2, height/2);
  rotate(radians(30+frameCount));
  for (PVector p : pointA) {
    fill(0, 0, 0);
    //ellipse(p.x, p.y, 10, 10);
    for (PVector q : pointA) {
      if (!p.equals(q)) {
        line(p.x, p.y, q.x, q.y);
      }
    }
    for (PVector r : pointB) {
      if (!p.equals(r)) {
        line(p.x, p.y, r.x, r.y);
      }
    }
  }
  for (PVector p : pointB) {
    fill(0, 0, 0);
    //ellipse(p.x, p.y, 10, 10);
    for (PVector q : pointB) {
      if (!p.equals(q)) {
        line(p.x, p.y, q.x, q.y);
      }
    }
  }
  pointA.clear();
  pointB.clear();
}