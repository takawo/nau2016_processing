ArrayList<Mover> movers = new ArrayList<Mover>();
ArrayList<Attractor> attractors = new ArrayList<Attractor>();
PVector gravity = new PVector(0, 0.1);
int moverNum = 3000;
int attractorNum = 30;
// setup関数 : 初回1度だけ実行される
void setup() {
  //fullScreen();
  size(960, 540, P2D); // ウィンドウサイズを960px,540pxに
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < moverNum; i++) {
    movers.add(new Mover(random(width), random(-100, 0)));
  }
  for (int i = 0; i < attractorNum; i++) {
    attractors.add(new Attractor());
  }
  background(0, 0, 0);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  noStroke();
  fill(0, 0, 0, 100);
  rect(0, 0, width, height);
  for (Mover m : movers) {
    m.update();
    m.display();
    m.applyForce(gravity);
    for (Attractor a : attractors) {
      float dist = PVector.dist(m.pos, a.pos);
      if (dist < 30) {
        a.attract(m);
      }
    }
  }
  for (Attractor a : attractors) {
    a.display();
  }
}

class Mover {
  PVector ppos;
  PVector pos;
  PVector vel;
  Mover(float x, float y) {
    reset(x, y);
  }
  void reset(float x, float y) {
    pos = new PVector(x, y);
    ppos = pos.get();
    vel = new PVector(random(-0.01, 0.01), random(0.5, 1));
  }

  void update() {
    pos.add(vel);
    vel.mult(0.998);
    vel.limit(2);
    if (pos.y > height) {
      pos.y = random(-200, -500);
      pos.x = random(width);
      ppos = pos.get();
    }
  }
  void applyForce(PVector v) {
    vel.add(v);
  }

  void display() {
    noFill();
    stroke(220, 80, 100, 10);
    line(pos.x, pos.y, ppos.x, ppos.y);
    ppos = pos.get();
  }
}
class Attractor {
  PVector pos;
  PVector vel;
  Attractor(float x, float y) {
    pos = new PVector(x, y);
  }
  Attractor() {
    pos = new PVector(random(width), random(height));
  }
  void attract(Mover m) {
    float theta = atan2(m.pos.y-pos.y, m.pos.x-pos.x);
    theta += map(noise(m.pos.x*0.01,m.pos.y*0.01),0,1,PI/12,-PI/12);
    PVector v = PVector.fromAngle(-theta);
    v.mult(0.5);
    m.vel.add(v);
  }
  void display() {
    noStroke();
    fill(0, 80, 100, 10);
    ellipse(pos.x, pos.y, 1, 1);
  }
}

void mousePressed() {
  background(0, 0, 0);
  for (Mover m : movers) {
    m.reset(random(width), random(-100, -300));
  }
}