ArrayList<Point> points = new ArrayList<Point>();
float rMin = 50;
float rMax = 550;
float rStep = 15;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (float r = rMin; r < rMax; r += rStep) {
    for (float angle = 0; angle < 360; angle += 20) {
      float theta = radians(angle);
      float x1 = cos(theta) * r;
      float y1 = sin(theta) * r;
      points.add(new Point(x1, y1));
    }
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  translate(width/2, height/2, 0);
  for (Point p : points) {
    p.display();
    for (Point q : points) {
      if (p.equals(q) == false) {
        float dist = p.calDist(q);
        if (dist < rStep*5) {
          stroke(0, 0, 100, 100);
          strokeWeight(1);
          line(p.x, p.y, q.x, q.y);
        }
      }
    }
  }
}

class Point {
  float x;
  float y;
  Point(float _x, float _y) {
    x = _x;
    y = _y;
  }
  void display() {
    stroke(0, 0, 100, 100);
    strokeWeight(5);
    point(x, y);
  }
  float calDist(Point q) {
    return dist(x, y, q.x, q.y);
  }
}
