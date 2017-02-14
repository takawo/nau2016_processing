
class Mover {
  PVector pos;
  PVector prev_pos;
  float angle;
  Mover(float x, float y) {
    pos = new PVector(x, y);
    prev_pos = pos.copy();
  }
  void update() {
    float nFactX = cos(frameCount*0.09)*300;
    float nFactY = sin(frameCount*0.05)*300;

    float noiz = noise(pos.x/abs(nFactX), pos.y/abs(nFactY))* 50;
    PVector vel = new PVector(cos(noiz) * 0.00195, sin(noiz) * 0.00195);
    pos.add(vel);
    if (pos.x > width) {
      pos.x -= width;
      prev_pos.x -= width;
    }
    if (pos.x < 0) {
      pos.x += width;
      prev_pos.x += width;
    }
    if (pos.y > height) {
      pos.y -= height;
      prev_pos.y -= height;
    }
    if (pos.y < 0) {
      pos.y += height;
      prev_pos.y += height;
    }
  }
  void display() {
    stroke(0, 0, 100);
    //line(pos.x, pos.y, prev_pos.x, prev_pos.y);
    point(pos.x, pos.y);
    prev_pos = pos.copy();
  }
}