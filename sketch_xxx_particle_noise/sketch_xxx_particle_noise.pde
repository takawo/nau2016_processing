ArrayList<Particle> particles = new ArrayList<Particle>();
int maxParticles = 0;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  for (float r = 100; r < 350; r += 50) {
    for (float angle = 0; angle < 360; angle += 5) {
      float theta = radians(angle);
      Particle particle = new Particle(cos(theta)*r, sin(theta)*r);
      particles.add(particle);
      maxParticles++;
    }
  }
  background(0, 0, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  translate(width/2, height/2);

  addRemoveParticles();
  for (Particle p : particles) {
    p.update();
    p.display();
  }
}
void addRemoveParticles() {
  // remove particles with no life left
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = particles.get(i);
    if (p.life <= 0) {
      particles.remove(i);
    }
  }
  // add particles until the maximum
  while (particles.size () < maxParticles) {
    float theta = random(TWO_PI);
    float r = int(random(2,7))*50;
    Particle particle = new Particle(cos(theta)*r, sin(theta)*r);
    particles.add(particle);
  }
}

void mousePressed(){
  println("quit");
  maxParticles = 0;
  // saveframe;
}

class Particle {
  PVector pos;
  float maxLife, life, lifeRate;
  Particle(float x, float y) {
    pos = new PVector(x, y);
    maxLife = random(0.5, 1.25);
    life = random(maxLife*0.5, maxLife);
    lifeRate = random(0.01, 0.02);
  }

  void update() {
    float angle = noise(pos.x*0.01, pos.y*0.01, frameCount*0.01)*TWO_PI;
    PVector vel = PVector.fromAngle(angle);
    pos.add(vel);
    life -= lifeRate;
  }

  void display() {
    fill(0, 0, 100);
    stroke(0, 0, 0, 50);
    float r = 8 * map(life, 0, maxLife, 0, 1.0);
    ellipse(pos.x, pos.y, r, r);
  }
}