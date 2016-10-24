float n;
void setup() {
  size(960, 540);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  n = int(random(3,10));
}

void draw() {
  background(0, 0, 100);
  for (float r = 100; r < 500; r += 10) {
    beginShape();
    for (float angle = 0; angle < 360; angle += 1) {
      float theta = radians(angle);
      pushMatrix();
      translate(width/2, height/2);
      rotate(theta+frameCount*0.001);
      float t = map(sin(theta*n-frameCount*0.035)*cos(frameCount*0.05), -1f, 1f, 0, 1f);
      float len = noise(t, frameCount*0.03)*r;
      PVector p = localToScreen(len, 0);
      vertex(p.x, p.y);
      popMatrix();
    }
    endShape(CLOSE);
  }
  if(random(1) < 0.01){
      n = int(random(3,10));
  }
}

PVector screenToLocal(float x, float y) {
  PVector in = new PVector(x, y);
  PVector out = new PVector();
  PMatrix2D current_matrix = new PMatrix2D();
  getMatrix(current_matrix);
  current_matrix.invert();
  current_matrix.mult(in, out);
  return out;
}

PVector localToScreen(float x, float y) {
  PVector in = new PVector(x, y);
  PVector out = new PVector();
  PMatrix2D current_matrix = new PMatrix2D();
  getMatrix(current_matrix);
  current_matrix.mult(in, out);
  return out;
}
