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

public class sketch_xxx_P3D_spiral_tree extends PApplet {

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  noStroke(); // \u7dda\u306e\u8272\u3092\u30ca\u30b7\u306b
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  // \u80cc\u666f\u3092\u9ed2\u306b
  background(0, 0, 0);
  // \u753b\u9762\u306e\u4e2d\u5fc3\u306b\u539f\u70b9\u3092\u79fb\u52d5
  translate(width/2, height/2, -1000);
  rotateX(-PI); // X\u8ef8\u3092\u4e2d\u5fc3\u306b\u53cd\u8ee2
  rotateY(frameCount*0.01f); // Y\u8ef8\u3092\u4e2d\u5fc3\u306b\u56de\u8ee2
  // \u958b\u59cb\u70b9\u306ey\u5ea7\u6a19
  float y = -1000;
  // box\u306e\u8272\u76f8
  float hue = frameCount;
  // \u56de\u8ee2\u6570\u306e\u4e2d\u3067\u89d2\u5ea6\u3092\u7e70\u308a\u8fd4\u3057\u5897\u52a0
  for (float angle = 0; angle < 360*10; angle += 17) {
    // \u73fe\u5728\u306e\u89d2\u5ea6\u3092\u30e9\u30b8\u30a2\u30f3\u3078\u5909\u63db
    float theta = radians(angle);
    // \u534a\u5f84\u3092\u56de\u8ee2\u6570\u306b\u3088\u3063\u3066\u8a2d\u5b9a\uff08250-0\u306e\u9593\u3067\u30de\u30c3\u30d4\u30f3\u30b0\uff09
    float r = map(angle,0,360*10,250,0);
    // Y\u8ef8\u3092\u4e2d\u5fc3\u306b\u56de\u8ee2\u3059\u308b\u3088\u3046\u306b\u3057\u3066\u3044\u308b\u305f\u3081\u3001x,z\u3067\u4e09\u89d2\u95a2\u6570\u3092\u9069\u5fdc\u3059\u308b
    float x = cos(theta)*r;
    float z = sin(theta)*r;
    // \u8272\u3092\u8a2d\u5b9a
    int c = color(hue,80,100);
    fill(c);
    // \u539f\u70b9\u5ea7\u6a19\u3092\u4fdd\u5b58
    pushMatrix();
    // \u8a08\u7b97\u3057\u305f\u4f4d\u7f6e\u3078\u539f\u70b9\u79fb\u52d5
    translate(x, y, z);
    // \u30dc\u30c3\u30af\u30b9\u305d\u306e\u3082\u306e\u3092\u56de\u8ee2
    rotateZ(-frameCount*0.03f);
    // \u30dc\u30c3\u30af\u30b9\u3092\u63cf\u753b
    box(15);
    // \u539f\u70b9\u5ea7\u6a19\u3092\u5fa9\u5e30
    popMatrix();

    //y += map(sin(frameCount*0.05), -1, 1, 1, 10);
    // y\u3092\u6bb5\u968e\u7684\u306b\u5897\u3084\u3059 = \u87ba\u65cb\u968e\u6bb5\u72b6\u306b\u56de\u8ee2\u3057\u3066\u3044\u304f
    y += 8;
    // \u8272\u76f8\u3092\u5897\u3084\u3059(360\u3067\u5272\u3063\u305f\u4f59\u308a\u3092\u4ee3\u5165\u3059\u308b\u3053\u3068\u30670-360\u3067\u5faa\u74b0\u3059\u308b)
    hue = (hue+1)%360;
  }
}
  public void settings() {  size(960, 540, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_P3D_spiral_tree" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
