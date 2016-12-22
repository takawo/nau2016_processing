float grid = 30;
ArrayList<Particle> particles = new ArrayList<Particle>();
// setup関数 : 初回1度だけ実行される
void setup() {
  //fullScreen();
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (float y = 0; y <= height; y += grid) {
    for (float x = 0; x <= width; x += grid) {
      particles.add(new Particle(x, y));
    }
  }
  background(0, 0, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  for (Particle p : particles) {
    p.update();
    p.display();
  }
  removeAddParticle();
}

void removeAddParticle() {
  ArrayList<Particle> removeParticle = new ArrayList<Particle>();

  for (int i = particles.size()-1; i > 0; i--) {
    Particle p = particles.get(i);
    if (p.life  < 0) {
      removeParticle.add(p);
      particles.remove(i);
    }
  }
  for (Particle p : removeParticle) {
    particles.add(new Particle(p.origin.x, p.origin.y));
  }
}


class Particle {
  PVector pos;
  PVector origin;
  float maxLife, life, lifeRate;
  color c;
  Particle(float x, float y) {
    pos = new PVector(x, y);
    origin = new PVector(x, y);
    maxLife = random(0.5, 1.25);
    life = random(maxLife*0.5, maxLife);
    lifeRate = random(0.01, 0.02);
    c = color(0, 0, 100, random(50, 100));
  }

  void update() {
    float angle = noise(pos.x*0.01, pos.y*0.01, frameCount*0.01)*TWO_PI*2;
    PVector vel = PVector.fromAngle(angle);
    pos.add(vel);
    life -= lifeRate;
  }

  void display() {
    fill(c);
    stroke(0, 0, 0, 50);
    float r = 4 * map(life, 0, maxLife, 0, 1.0);
    r = constrain(r, 0, 4);
    ellipse(pos.x, pos.y, r, r);
  }
}