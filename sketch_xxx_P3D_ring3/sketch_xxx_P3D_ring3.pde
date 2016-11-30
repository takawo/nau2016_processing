ArrayList<Point> points = new ArrayList<Point>();
int num = 500;
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
  // lights();
  // ambientLight(0,0,30);
  translate(width/2, height/2, -(minR+maxR)/1.5);
  rotateX(frameCount*0.003);
  rotateY(frameCount*0.004);
  rotateZ(frameCount*0.001);
  for (int k = 0; k < num; k++) {
    Point r = points.get(k);
    for (int j = 0; j < num; j++) {
      Point q = points.get(j);
      if()
      for (int i = 0; i < num; i++) {
        Point p = points.get(i);
        noStroke();
        fill(0,0,100,10);
        if (i != j && j != k && k != i && p.pos.dist(q.pos) + q.pos.dist(r.pos) + r.pos.dist(p.pos) < 300){
          beginShape();
          vertex(p.pos.x, p.pos.y, p.pos.z);
          vertex(q.pos.x, q.pos.y, q.pos.z);
          vertex(r.pos.x, r.pos.y, r.pos.z);
          endShape(CLOSE);
        }else{
          continue;
          // noFill();
          // stroke(220,80,100,20);
          // strokeWeight(2);
          // point(p.pos.x,p.pos.y,p.pos.z);
        }
      }
    }
  }
  for(Point p:points){
    p.update();
  }
}
