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

public class sketch_xxx_P3D_lines extends PApplet {

float r = 200;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  noFill();
  background(200, 30, 30);
  translate(width/2, height/2, -500);
  lights();
  rotateY(frameCount*0.01f);
  rotateX(frameCount*0.003f);
  beginShape();
  for (float angle = 0; angle < 360; angle += .1f) {
    float theta1 = radians(angle);
    float theta2 = radians(angle+180);
    float x1 = cos(theta1) * r;
    float y1 = r*1.5f;
    float z1 = sin(theta1) * r;
    float x2 = cos(theta2) * r;
    float y2 = -r*1.5f;
    float z2 = sin(theta2) * r;
    //line(x1, y1, z1, x2, y2, z2);
    stroke(angle, 80, 100);
    vertex(x1, y1, z1);
    vertex(x2, y2, z2);
  }
  endShape(CLOSE);
}
  public void settings() {  size(960, 540, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_P3D_lines" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
