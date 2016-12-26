class Blob {
  PVector pos;
  float r;
  PVector vel;
  Blob(float x, float y) {
    pos = new PVector(x, y);
    r = 40;
    vel = PVector.random2D().mult(random(2,5));
  }
  void update() {
    pos.add(vel);

    if(pos.x > width || pos.x < 0){
      vel.x *= -1;
    }
    if(pos.y > height || pos.y < 0){
      vel.y *= -1;
    }
  }
  void display() {
    //noFill();
    //stroke(0, 0, 100);
    //ellipse(pos.x, pos.y, r*2, r*2);
  }
}
