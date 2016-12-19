class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  color c;
  float radius;
  float n;
  Mover() {
    radius = random(1, 8);
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-1, 1), 0);
    acc = new PVector(0, map(radius, 3, 20, 0.01, 0.05));
    c = color(random(180, 220), random(50, 80), 100);
    n = map(radius, 3, 20, 0.3, 0.15);
  }

  void update() {
    vel.add(acc);
    vel.limit(10);
    pos.add(vel);
  }
  void attract(PVector attractor) {
    PVector dir = PVector.sub(attractor, pos);
    dir.normalize();
    dir.mult(n);
    acc = dir.copy();
  }

  void checkEdges() {
    if (pos.x-radius < 0 || pos.x + radius > width) {
      vel.x *= -1;
      acc.x *= -1;
    }
    if (pos.y-radius < 0 || pos.y + radius > height) {
      vel.y *= -1;
    }
    pos.x = constrain(pos.x, radius, width-radius);
    pos.y = constrain(pos.y, radius, height-radius);
  }


  void display() {
    fill(c);
    noStroke();
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }
}