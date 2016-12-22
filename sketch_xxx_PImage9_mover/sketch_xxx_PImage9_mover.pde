ArrayList<Mover> movers = new ArrayList<Mover>();
PImage img;
int grid = 10;
int moverNum;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(515, 768); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  img = loadImage("MonaLisa.jpg");
  moverNum = 0;
  for (int y = 0; y <= height; y += grid) {
    for (int x = 0; x <= width; x += grid) {
      color c = img.get(x, y);
      Mover m = new Mover(x, y, c, grid/2);
      movers.add(m);
      moverNum++;
    }
  }
  background(0, 0, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  //image(img, 0, 0);
  fill(0, 0, 100, 10);
  rect(0, 0, width, height);
  ArrayList<Mover> removeMovers = new ArrayList<Mover>();
  for (Mover m : movers) {
    m.update();
    m.display();
    if (m.life < 0) {
      removeMovers.add(m);
    }
  }
  for (Mover removeMover : removeMovers) {
    movers.remove(removeMover);
  }
  while (movers.size()< moverNum) {
    int x = (int)random(img.width);
    int y = (int)random(img.height);
    color c = img.get(x, y);
    Mover m = new Mover(x, y, c, grid/2);
    movers.add(m);
  }
  //noLoop();
}

class Mover {
  PVector pos;
  float theta;
  float theta_vel;
  float theta_acc;
  float size;
  color c;
  float maxLife;
  float life;
  float lifeRate;
  Mover(float x, float y, color _c, float _size) {
    pos = new PVector(x, y);
    theta = random(TWO_PI);
    c = _c;
    theta_vel = 0; 
    size = _size;
    theta_acc = map(brightness(_c), 0, 100, 0.001, 0.05);
    maxLife = random(1.5, 3.0);
    life = random(maxLife/2, maxLife);
    lifeRate = random(0.001, 0.002);
  }
  void update() {
    theta += theta_vel;
    theta_vel += theta_acc;
    theta_vel = constrain(theta_vel, 0, 0.01);
    life -= lifeRate;
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(c);
    strokeWeight(size/3);
    line(size, 0, -size, 0);
    fill(c);
    noStroke();
    ellipse(size, 0, size, size);
    ellipse(-size, 0, size, size);
    popMatrix();
  }
}