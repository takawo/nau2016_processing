import gab.opencv.*;
import processing.video.*;

Capture cam;
OpenCV cv;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(1280, 720); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  cam = new Capture(this, 1280, 720);
  cam.start();  
  cv = new OpenCV(this, 1280, 720);
  cv.startBackgroundSubtraction(5, 3, 0.5);
}

void captureEvent(Capture cam) {
  cam.read();
  cv.loadImage(cam);
  cv.updateBackground();
  cv.dilate();
  cv.erode();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  pushMatrix();
  translate(width/2-200, height/2);
  drawEye();
  popMatrix();
  pushMatrix();
  translate(width/2+200, height/2);
  drawEye();
  popMatrix();
  int i = 0;
  for (Contour contour : cv.findContours()) {
    contour.draw();
    if (i == 0) {
      println(contour.getBoundingBox());
    }
    i++;
  }
}

void drawEye() {
  strokeWeight(5);
  stroke(0, 0, 0);
  noFill();
  ellipse(0, 0, 200, 200);
  PVector center = localToScreen(0, 0);
  float theta = atan2(mouseY-center.y, mouseX-center.x);
  float x = cos(theta) * 75;
  float y = sin(theta) * 75;
  noStroke();
  fill(0, 0, 0);
  ellipse(x, y, 50, 50);
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