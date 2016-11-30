class Point extends PVector {
  float theta;
  float incTheta;
  float r;
  PVector pos;
  Point(float _theta, float _r) {
    theta = _theta;
    r = _r;
    float n = (random(1) + random(1) + random(1) +random(1) + random(1)) / 5f;
    float x = cos(theta) * r;
    float y = sin(theta) * r;
    float z = map(n, 0, 1, -r/1.5, r/1.5);
    pos = new PVector(x, y, z);
    incTheta = random(-0.005,0.005);
  }
  void update() {
    theta += incTheta;
    pos.x = cos(theta) * r;
    pos.y = sin(theta) * r;
  }
}
