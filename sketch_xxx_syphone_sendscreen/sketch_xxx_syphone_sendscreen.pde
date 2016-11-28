import codeanticode.syphon.*;

SyphonServer server;

void settings() {
  size(960, 540, P3D);
  PJOGL.profile=1; // important!!!
}

void setup() {
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(0, 0, 0);
  lights();
  noFill();
  stroke(0, 0, 100);
  for (float n = 0; n < 1.0; n += 0.02) {
    pushMatrix();
    float size = map(n, 0, 1, 10, 600);
    float theta = map(n, 0, 1, 0, PI);
    translate(width/2, height/2, -200);
    rotateX(theta/4 + frameCount * 0.0035);
    rotateY(theta + frameCount * 0.0053); 
    box(size);
    popMatrix();
  }
  server.sendScreen();
}