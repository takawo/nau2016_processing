ArrayList<Particle> particles = new ArrayList<Particle>();
int maxParticles = 100;
PGraphics pg;

color PGRAPHICS_COLOR;
color BACKGROUND_COLOR;

float fc;

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  PGRAPHICS_COLOR = color(0,0,0);
  BACKGROUND_COLOR = color(0,0,100);

  PFont font = createFont("YuGothic-Bold", 300);

  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.textFont(font,300);
  pg.textSize(300);
  pg.textAlign(CENTER, CENTER);
  pg.fill(PGRAPHICS_COLOR);
  pg.text("TYPE", pg.width/2, pg.height/2);
  pg.endDraw();

  background(BACKGROUND_COLOR);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  fc = frameCount * 0.01;
  addRemoveParticles();
  // update and display each particle in the list
  for (Particle p : particles) {
    p.update();
    p.display();
  }
}

void addRemoveParticles() {
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = particles.get(i);
    if (p.life <= 0) {
      particles.remove(i);
    }
  }
  while (particles.size () < maxParticles) {
    particles.add(new Particle());
  }
}

class Particle{
  PVector pos;
  PVector vel;
  float life,maxLife,lifeRate;

  Particle(){
    getPosition();
    maxLife = random(0.5,1.2);
    life = random(maxLife/2,maxLife);
    lifeRate = random(0.01,0.02);
  }

  void update(){
    float angle = noise(pos.x * 0.01, pos.y * 0.01, fc) * TWO_PI;
    PVector vel = PVector.fromAngle(angle + fc);
    pos.add(vel);
    life -= lifeRate; // decrease life by the lifeRate (the particle is removed by the addRemoveParticles() method when no life is left)
  }

  void display() {
    fill(255); // white fill
    stroke(0, 125); // transparant black stroke
    float r = 8 * life/maxLife; // radius of the ellipse
    ellipse(pos.x, pos.y, r, r); // draw ellipse
  }
  void getPosition() {
    while (pos == null || !isInText (pos)) pos = new PVector(random(width), random(height));
  }

  boolean isInText(PVector v) {
    return pg.get(int(v.x), int(v.y)) == PGRAPHICS_COLOR;
  }


}
