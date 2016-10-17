int num = 100;
ArrayList<Mover> movers = new ArrayList<Mover>();
void setup() {
  size(960, 540);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(30);
  background(220, 50, 25);
  for (int i = 0; i < num; i++) {
    movers.add(new Mover());
  }
}

void draw() {
  fill(0, 0, 25, 10);
  //rect(0,0,width,height);
  stroke(220, 50, 100);
  strokeWeight(1.5);
  fill(250, 100, 100);
  translate(width/2, height/2);
  for (Mover m : movers) {
    //m.update();
    m.draw();
  }
}

class Mover {
  float startNoise;
  float startRadian;
  float radian;
  float radius;
  float x;
  float y;
  public Mover() {
    startNoise = random(100);
    startRadian = random(TWO_PI);
  }

  void update() {
    radius = 100 + 100 * map(noise(startNoise + frameCount* 0.03), 0.0, 1.0, -1.0, 1.0);
    radian = startRadian + frameCount * 0.05;
    x = cos(radian) * radius;
    y = sin(radian) * radius;
  }

  void draw() {
    ellipse(x, y, 10, 10);
  }
}