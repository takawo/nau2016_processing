ArrayList<Point> points = new ArrayList<Point>();
float rMin = 50;
float rMax = 550;
float rStep = 15;
float angleStep = 45;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  int counter  = 0;
  for (float r = rMin; r < rMax; r += rStep) {
    for (float angle = 0; angle < 360; angle += angleStep) {
      float theta = radians(angle);
      float x1 = 0;
      float y1 = 0;
      if(counter%2 == 0){
        x1 = cos(theta) * r;
        y1 = sin(theta) * r;

      }else{
        x1 = cos(theta-radians(angleStep/2)) * r;
        y1 = sin(theta-radians(angleStep/2)) * r;
      }
      float z1 = map(dist(x1,y1,0,0),0,sqrt(sq(width/2)+sq(height/2)),-250,250);
      points.add(new Point(x1, y1, z1));
    }
    counter++;
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  translate(width/2, height/2, 0);
  rotateY(frameCount*0.005);
  rotateZ(frameCount*0.01);
  for (Point p : points) {
    p.display();
    for (Point q : points) {
      if (p.equals(q) == false) {
        float dist = p.calDist(q);
        if (dist < 200) {
          stroke(0, 0, 100, 100);
          strokeWeight(1);
          line(p.x, p.y,p.z, q.x, q.y,q.z);
        }
      }
    }
  }
}

class Point {
  float x;
  float y;
  float z;
  Point(float _x, float _y,float _z) {
    x = _x;
    y = _y;
    z = _z;
  }
  void display() {
    stroke(0, 0, 100, 100);
    strokeWeight(5);
    pushMatrix();
    translate(x,y,z);
    point(0,0);
    popMatrix();
  }
  float calDist(Point q) {
    return dist(x, y, z, q.x, q.y, q.z);
  }
}
