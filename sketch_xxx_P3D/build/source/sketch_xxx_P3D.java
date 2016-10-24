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

public class sketch_xxx_P3D extends PApplet {

float rotateAngle = 0;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB \u8272\u7a7a\u9593
  sphereDetail(8);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  // \u80cc\u666f\u8272\u3092\u9ed2\u3067\u63cf\u753b
  background(0, 0, 0);
  // \u539f\u70b9\u5ea7\u6a19\u3092\u753b\u9762\u4e2d\u592e\u306b\u79fb\u52d5 (x,y,z)
  translate(width/2, height/2, -300);
  // Y\u8ef8\u3092\u4e2d\u5fc3\u306b\u56de\u8ee2
  rotateY(frameCount*0.01f);

  noFill();
  stroke(0, 0, 100);

  sphere(100);


  pushMatrix();
  translate(0,0,-350);
  box(100);
  popMatrix();

  pushMatrix();
  translate(0,0,350);
  sphere(100);
  popMatrix();
}
  public void settings() {  size(960, 540, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_P3D" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
