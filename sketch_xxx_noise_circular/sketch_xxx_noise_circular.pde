void setup() {
  size(960, 540);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  fill(0, 0, 100, 10);
  noStroke();
  rect(0, 0, width, height);
  noFill();
  translate(width/2, height/2);
  for (float r = 50; r < 800; r += 30) {
    beginShape();
    for (float angle = 0; angle < 360; angle++) {
      float theta = radians(angle);
      float x = cos(theta);
      float y = sin(theta);
      float r2 = noise(x, y, r/100+frameCount*0.01)*r;
      x *= r2;
      y *= r2;
      vertex(x, y);
    }
    stroke(frameCount%360, 80, 50);
    endShape(CLOSE);
  }
}