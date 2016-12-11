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

public class sketch_xxx_eye_moving1 extends PApplet {

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 100);
  pushMatrix();
  translate(width/2-200, height/2);
  drawEye();
  popMatrix();
  pushMatrix();
  translate(width/2+200, height/2);
  drawEye();
  popMatrix();
}

public void drawEye() {
  strokeWeight(5);
  stroke(0, 0, 0);
  noFill();
  ellipse(0, 0, 200, 200);
  PVector center = localToScreen(0,0);
  float theta = atan2(mouseY-center.y, mouseX-center.x);
  float x = cos(theta) * 75;
  float y = sin(theta) * 75;
  noStroke();
  fill(0, 0, 0);
  ellipse(x, y, 50, 50);
}

public PVector screenToLocal(float x, float y) {
  PVector in = new PVector(x, y);
  PVector out = new PVector();
  PMatrix2D current_matrix = new PMatrix2D();
  getMatrix(current_matrix);
  current_matrix.invert();
  current_matrix.mult(in, out);
  return out;
}

public PVector localToScreen(float x, float y) {
  PVector in = new PVector(x, y);
  PVector out = new PVector();
  PMatrix2D current_matrix = new PMatrix2D();
  getMatrix(current_matrix);
  current_matrix.mult(in, out);
  return out;
}
  public void settings() {  size(1280, 720);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_eye_moving1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
