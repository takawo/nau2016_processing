import processing.video.*;

Capture cam;

void setup() {
  size(1280, 720);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  cam = new Capture(this, 1280, 720);
  cam.start();
}

void draw() {
  if (cam.available()) {
    background(0, 0, 0);
    cam.read();
    cam.loadPixels();
    for ( int y = 0; y < cam.height; y+=20 ) {
      beginShape();
      for ( int x = 0; x < cam.width; x++ ) {
        color c = cam.get(x, y);
        float brightness = brightness(c);
        float n = noise(x/70f, y/60f, (brightness+frameCount*5)/50f);
        n = map(n, 0, 1, 1, -1);
        stroke(0, 0, 100);
        strokeWeight(1);
        noFill();
          vertex(x, y+n*30);
        //vertex(x, y+(red(c)+green(c)+blue(c))/25);
      }
      endShape();
    }
  }
}