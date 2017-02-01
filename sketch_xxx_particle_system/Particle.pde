class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float life;
  float lifeMax;
  float lifeRate;
  float gravity = 0.05;
  color c;
  float friction = 0.998;

  Particle(PVector _pos, color _c) {
    pos = _pos.copy();
    vel = new PVector(random(-3, 3), random(-3, 0));
    acc = new PVector(0, -gravity);
    lifeMax = random(100, 150);
    life = random(lifeMax, lifeMax*2);
    lifeRate = random(lifeMax/200, lifeMax/100);
    c = _c;
  }
  void run() {
    update();
    display();
  }

  void update() {
    vel.add(acc);
    vel.mult(friction);
    pos.add(vel);
    life -= lifeRate;

    if (pos.x < 0 || pos.x > width) {
      vel.x *= -1;
    }
    if ( pos.y > height) {
      vel.y *= -1;
    }
  }

  void display() {
    //stroke(0, 0, 100, life);
    //strokeWeight(2);
    
    noStroke();
    fill(c, life/1.5);
    ellipse(pos.x, pos.y, 12, 12);
  }

  boolean isDead() {
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
}