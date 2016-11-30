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

public class sketch_xxx_lerpStudy extends PApplet {

float n = 4;
float l = 50;
//float r = 250;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 100);
  translate(width/2, height/2);
  rotate(-frameCount*0.001f);
  for (float r = 100; r < 250; r += 5) {
    for (float angle = 0; angle < 360; angle += 360/n) {
      float theta1 = radians(angle);
      float theta2 = radians(angle + 360/n);
      float x1 = cos(theta1) * r;
      float y1 = sin(theta1) * r;
      float x2 = cos(theta2) * r;
      float y2 = sin(theta2) * r;
      beginShape();
      for (float m = 0; m < 1.0f; m += 1.0f/l) {
        float x = lerp(x1, x2, m);
        float y = lerp(y1, y2, m);
        float theta = atan2(y, x)-PI/4;
        pushMatrix();
        translate(x, y);
        rotate(theta);
        stroke(0, 0, 0);
        //line(0, 0, sin(theta*n+frameCount*TWO_PI/300)*50, 0);
        noStroke();
        fill(0, 0, 0);
        PVector pos = localToScreen(sin(theta*n+frameCount*TWO_PI/(l*n))*r/4, 0);
        vertex(pos.x-width/2,pos.y-height/2);
        popMatrix();
        noStroke();
      }
      endShape(CLOSE);
    }
  }
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
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_lerpStudy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
