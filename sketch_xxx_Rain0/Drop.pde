class Drop {
  float x = random(width);
  float y = random(-height, height);
  float z = random(0, 20);
  float yspeed = map(z, 0, 20, 1, 20);
  float len = map(z, 0, 20, 15, 30);
  void fall() {
    y = y + yspeed;
    float gravity = map(z, 0, 20, 0, 0.2);
    yspeed = yspeed + gravity;
    if (y > height) {
      y = random(-200, -100);
      yspeed = random(4, 10);
    }
  }


  void show() {
    float thick = map(z, 0, 20, 1, 2);
    strokeWeight(thick);
    stroke(271, 80, 88);
    line(x, y, x, y+len);
  }
}