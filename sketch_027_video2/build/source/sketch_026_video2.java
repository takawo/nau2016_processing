import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_026_video2 extends PApplet {



// \u30d3\u30c7\u30aa\u30ab\u30e1\u30e9
Capture cam;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  // \u30ab\u30e1\u30e9\u306e\u521d\u671f\u5316
  cam = new Capture(this,1280,720);
  cam.start(); // \u30ab\u30e1\u30e9\u306e\u8d77\u52d5
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  fill(0,0,100,10);
  rect(0,0,width,height);
  // \u30ab\u30e1\u30e9\u304c\u5229\u7528\u53ef\u80fd\u306a\u6642
  if (cam.available()) {
    // \u30ab\u30e1\u30e9\u304b\u3089\u306e\u6620\u50cf\u8aad\u307f\u8fbc\u307f
    cam.read();
  }
  // \u30d4\u30af\u30bb\u30ec\u30fc\u30c8\u306e\u30b5\u30a4\u30ba
  int grid = 10;
  // x,y\u305d\u308c\u305e\u308c\u306e\u65b9\u5411\u3067\u7e70\u308a\u8fd4\u3057\u51e6\u7406
  for (int y = 0; y < cam.height; y += grid) {
    for (int x = 0; x < cam.width; x += grid) {
      // x,y\u5ea7\u6a19\u3067\u30ab\u30e1\u30e9\u306e\u8a72\u5f53\u5ea7\u6a19\u306e\u8272\u3092\u53d6\u5f97
      int c = cam.get(x, y);
      float hue = hue(c);
      float theta = radians(hue);
      float x2 = cos(theta) * grid;
      float y2 = sin(theta) * grid;
      pushMatrix();
      // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u306b\u6307\u5b9a
      stroke(c);
      strokeWeight(3);
      translate(x,y);
      line(0,0,x2,y2);
      popMatrix();
    }
  }
  // \u5de6\u4e0a\u306b\u30ab\u30e1\u30e9\u306e\u753b\u50cf\u3092\u8868\u793a
  image(cam, 20, 20, 320, 180); // x:20 y:20\u306e\u4f4d\u7f6e\u306b320x180px\u3067\u63cf\u753b
}
  public void settings() {  size(1280, 720);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_026_video2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
