void setup() {
  size(960, 540);
  noStroke();
}

void draw() {
  background(255,255,255);
  float r1 = constrain(abs(randomGaussian()*10),5,50);
  //float r2 = constrain(abs(randomGaussian()*10),5,50);
  drawNoise(r1,r1);
}

void drawNoise(float gridX,float gridY) {
  for (float y = 0; y < height; y += gridY) {
    for (float x = 0; x < width; x += gridX) {
      fill(noise(x, y, (frameCount+x+y)/100)*255);
      rect(x, y, gridX, gridY);
    }
  }
}