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

public class sketch_P3D_spheres_line extends PApplet {

// reference: http://p5aholic.hatenablog.com/entry/2015/06/15/194250

float velocity = 0;        // t\u306b\u8db3\u3059\u5024
float acceleration = 0.05f; // velocity\u306b\u8db3\u3059\u5024

public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u306e\u6307\u5b9a
  colorMode(HSB, 360, 100, 100); // HSB\u306e\u8272\u7a7a\u9593
  sphereDetail(8); // \u7403\u306e\u89e3\u50cf\u5ea6\u3092\u6307\u5b9a
}

public void draw() {
  background(0, 0, 0); // \u80cc\u666f\u3092\u9ed2\u306b\u6307\u5b9a

  translate(width/2, height/2, -300); //\u753b\u9762\u306e\u4e2d\u5fc3\u306b\u539f\u70b9\u3092\u79fb\u52d5
  rotateX(frameCount*0.01f); // X\u8ef8\u3092\u4e2d\u5fc3\u306b\u56de\u8ee2
  rotateY(frameCount*0.005f); // Y\u8ef8\u3092\u4e2d\u5fc3\u306b\u56de\u8ee2

  // \u4e00\u3064\u524d\u306e\u5ea7\u6a19\u3092\u683c\u7d0d\u3059\u308b
  float lastX = 0;
  float lastY = 0;
  float lastZ = 0;

  // \u534a\u5f84
  float radius = 400;
  // \u89d2\u5ea6
  float s = 0;
  float t = 0;

  while (s <= 180) {
    float radianS = radians(s);
    float radianT = radians(t);

    // \u73fe\u5728\u306e\u5ea7\u6a19\u3092\u66f4\u65b0
    float x = radius * sin(radianS) * cos(radianT);
    float y = radius * sin(radianS) * sin(radianT);
    float z = radius * cos(radianS);

    stroke(220,80,100);
    if (lastX != 0) {
      strokeWeight(1);
      // \u73fe\u5728\u306e\u5ea7\u6a19\u304b\u3089\u4e00\u3064\u524d\u306e\u5ea7\u6a19\u306b\u7dda\u3092\u5f15\u304f
      line(x, y, z, lastX, lastY, lastZ);
    }
    pushMatrix();
    translate(x,y,z);
    fill(220,80,100);
    noStroke();
    sphere(4);
    popMatrix();

    // \u4e00\u3064\u524d\u306e\u5ea7\u6a19\u3092\u66f4\u65b0
    lastX = x;
    lastY = y;
    lastZ = z;

    // s\u3068t\u3092\u540c\u6642\u306b\u66f4\u65b0
    s++;
    t+=36;
  }
  velocity += map(sin(frameCount*0.01f),-1,1,-0.5f,0.5f);
}
  public void settings() {  size(960, 540, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_P3D_spheres_line" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
