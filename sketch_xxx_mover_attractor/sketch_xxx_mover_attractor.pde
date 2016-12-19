int num = 300;

ArrayList<Mover> movers = new ArrayList<Mover>();
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < num; i++) {
    Mover m = new Mover();
    movers.add(m);
  }
  background(0, 0, 0);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  fill(0, 0, 0, 5);
  rect(0, 0, width, height);
  float theta_a = frameCount * 0.037/2;
  float theta_b = frameCount * 0.052/1.2;
  float r = 250;
  float x = width/2 + cos(theta_a) * width/2;
  float y = height/2 + sin(theta_b) * height/2;
  fill(120,80,100);
  //ellipse(x,y,20,20);
  PVector p = new PVector(x, y);
  for (int i = 0; i < movers.size(); i++) {
    Mover m = movers.get(i);
    m.attract(p);
    m.update();
    m.display();
    // m.checkEdges();
  }
}

void mousePressed() {
  for (int i = 0; i < movers.size(); i++) {
    Mover m = movers.get(i);
    m.vel = new PVector(random(-500, 500), random(-500, 500));
  }
}