import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

ParticleSystem ps;
color[] chemistry = {#0C2550, #A3D0C1, #FDF6DD, #FEE406, #F4651C};
color[] palette = chemistry;

OpenCV opencv;
Rectangle[] faces;
Capture cam;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(1280, 720); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  blendMode(ADD);
  smooth(); // 描画を滑らかに
  opencv = new OpenCV(this, 1280/4, 720/4);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  cam = new Capture(this, 1280, 720);  
  cam.start();

  ps = new ParticleSystem(new PVector(width/2, height/2), palette);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  if (cam != null) {
    image(cam, 0, 0);
  }
  if (faces != null) {
    for (int i = 0; i < faces.length; i++) {
      //rect(faces[i].x*4, faces[i].y*4, faces[i].width*4, faces[i].height*4);
      int x = (int)random(faces[i].x*4, faces[i].x*4+faces[i].width*4);
      int y = (int)random(faces[i].y*4, faces[i].y*4+faces[i].height*4);
      if (brightness(cam.get(x, y)) < 50) { 
        ps.origin.set(x, y);
        ps.addParticle();
      }
    }
  }
  ps.run();
}

void captureEvent(Capture cam) {
  cam.read();
  PImage img = cam.copy();
  img.resize(cam.width/4, cam.height/4);
  opencv.loadImage(img);
  faces = opencv.detect();
}