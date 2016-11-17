import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_xxx_P3D_box extends PApplet {

// color reference : https://goo.gl/J0T8H7
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
ArrayList<Box> boxes = new ArrayList<Box>();
int num = 500;
int worldSize = 500;

public void setup() {
  
  // size(960, 540, P3D); // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  for (int i = 0; i < num; i++) {
    float rx = (random(1)+random(1)+random(1)+random(1)+random(1))/5;
    float ry = (random(1)+random(1)+random(1)+random(1)+random(1))/5;
    float rz = (random(1)+random(1)+random(1)+random(1)+random(1))/5;
    float x = map(rx, 0, 1, -worldSize, worldSize);
    float y = map(ry, 0, 1, -worldSize, worldSize);
    float z = map(rz, 0, 1, -worldSize, worldSize);
    float size = random(10, 50);
    Box b = new Box(x, y, z, size);
    boxes.add(b);
  }
  hint(ENABLE_DEPTH_TEST);
  noStroke();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(206, 72, 47);
  lights();
  ambientLight(0, 0, 20);
  float n = sin(frameCount*0.001f);
  float fov = map(n,-1,1,-PI/2,PI/2);  //\u8996\u91ce\u89d2
  //perspective(\u8996\u91ce\u89d2\u3001\u7e26\u6a2a\u306e\u6bd4\u7387\u3001\u8fd1\u3044\u9762\u307e\u3067\u306e\u8ddd\u96e2\u3001\u9060\u3044\u9762\u307e\u3067\u306e\u8ddd\u96e2)
  perspective(fov, PApplet.parseFloat(width)/PApplet.parseFloat(height), 1.0f, 1000.0f);
  translate(width/2, height/2, 0);
  rotateY(map(sin(frameCount*0.005f), -1, 1, PI, -PI));
  rotateZ(map(cos(frameCount*0.001f), -1, 1, PI, -PI));
  for (Box b : boxes) {
    b.update();
    b.display();
  }
}

class Box {
  float x;
  float y;
  float z;
  float thetaX;
  float thetaY;
  float thetaZ;
  float stepX;
  float stepY;
  float stepZ;
  float size;
  float boxWidth;
  float boxHeight;
  float boxDepth;
  int c;
  int color1;
  int color2;
  Box(float _x, float _y, float _z, float _size) {
    color1 = color(186, 87, 64);
    color2 = color(32, 90, 100);
    c = lerpColor(color1, color2, random(1));
    x = _x;
    y = _y;
    z = _z;
    size = _size;
    thetaX = random(TWO_PI);
    thetaY = random(TWO_PI);
    thetaZ = random(TWO_PI);
    boxWidth = random(size/10, size);
    boxHeight = random(size/10, size);
    boxDepth = random(size/10, size);
    float stepSeed = map((boxWidth + boxHeight + boxDepth), 0, size*3, TWO_PI/100f, TWO_PI/600f);
    stepX = random(stepSeed);
    stepY = random(stepSeed);
    stepZ = random(stepSeed);
  }
  public void update() {
    thetaX += stepX;
    thetaY += stepY;
    thetaZ += stepZ;
  }
  public void display() {
    pushMatrix();
    translate(x, y, z);
    rotateX(thetaX);
    rotateY(thetaY);
    rotateZ(thetaZ);
    fill(c);
    box(boxWidth, boxHeight, boxDepth);
    popMatrix();
  }
}
  public void settings() {  fullScreen(P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_P3D_box" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
