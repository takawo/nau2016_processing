import gab.opencv.*;
import processing.video.*;

Capture cam;
OpenCV opencv;

void setup() {
  size(1280, 720);
  colorMode(HSB, 360, 100, 100, 100);
  cam = new Capture(this, 1280, 720);
  opencv = new OpenCV(this, 1280, 720);

  opencv.startBackgroundSubtraction(5, 3, 0.5);

  cam.start();
}

void draw() {
  fill(0, 0, 100, 5);
  rect(0, 0, width, height);
  //image(cam, 0, 0);  
  opencv.loadImage(cam);

  opencv.updateBackground();

  opencv.dilate();
  opencv.erode();

  noFill();
  stroke(0, 80, 100);
  strokeWeight(3);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}

void captureEvent(Capture cam) {
  cam.read();
}