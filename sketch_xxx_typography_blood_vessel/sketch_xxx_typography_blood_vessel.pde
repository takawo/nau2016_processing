import processing.pdf.*;

PGraphics pg;
PFont font;

ArrayList<Mover> movers = new ArrayList<Mover>();

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  font = createFont("GenShinGothic-P-Bold", 200);
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.colorMode(HSB, 360, 100, 100);
  pg.background(0, 0, 100);
  pg.fill(0, 0, 0);
  pg.textFont(font);
  pg.textSize(150);
  pg.textLeading(150);
  pg.textAlign(CENTER, CENTER);
  pg.text("BLOOD", width/2, height/2);
  pg.endDraw();
  background(0, 0, 0);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  for (int i = 0; i < 100; i++) {
    int x = (int)random(pg.width);
    int y = (int)random(pg.height);
    color c = pg.get(x, y);
    if (brightness(c) < 10) {
      movers.add(new Mover(x, y));
    }
  }
  ArrayList<Mover> removers = new ArrayList<Mover>();
  for (Mover m : movers) {
    m.update();
    m.display();
    if (m.life < 0) {
      removers.add(m);
    }
  }
  for (Mover m : removers) {
    movers.remove(m);
  }
}
void mousePressed() {
}

class Mover {
  PVector pos;
  float life;
  float lifeMax;
  float lifeRate;
  float initial_t;
  color c;
  float b;
  Mover(float x, float y) {
    pos = new PVector(x, y);
    lifeMax = random(0.75, 1.5);
    life = random(lifeMax/2, lifeMax);
    lifeRate = random(0.01, 0.03);
    initial_t = random(TWO_PI);
    c = color(0, random(40, 80), random(25, 60));
  }
  void update() {
    b = brightness(pg.get((int)pos.x, (int)pos.y));
    if (b > 10) {
      life -= lifeRate;
    }
    float n = noise(pos.x/10f, pos.y/10f, frameCount*0.1);
    float t = initial_t + map(n, 0, 1, -PI, PI);
    float m = random(1, 3);
    PVector vel = new PVector(cos(t)*m, sin(t)*m);
    pos.add(vel);
  }

  void display() {
    float size = map(life, 0.1, lifeMax, 1, 3);
    if (b > 10) {
      fill(c);
      stroke(0, 0, 100, 10);
    } else {
      fill(0, 100, 50, 60);
      noStroke();
    }
    ellipse(pos.x, pos.y, size, size);
  }
}