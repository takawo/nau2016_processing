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

public class sketch_xxx_P3D_torus extends PApplet {

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  noStroke();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(227, 20, 24);
  fill(212,85,80);
  lights();
  translate(width/2, height/2, -700);
  rotateY(frameCount*0.01f);
  rotateZ(PI/4*sin(frameCount*0.003f));
  float r = 300;
  for (float angle = 0; angle < 360; angle += 10) {
    float theta = radians(angle);
    float x = cos(theta)*r;
    float y = 0;
    float z = sin(theta)*r;
    pushMatrix();
    translate(x, y, z);
    rotateY(-theta);
    rotateZ(frameCount*0.01f);
    float r2 = 130;
    for(float angle2 = 0; angle2 < 360; angle2 += 45){
      float theta2 = radians(angle2);
      float t = cos(theta2)* r2;
      float s = sin(theta2)* r2;
      pushMatrix();
      translate(t,s,0);
      rotateX(-frameCount*0.01f);
      box(5);
      popMatrix();
    }
    //box(20);
    popMatrix();
  }
}
  public void settings() {  size(960, 540, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_P3D_torus" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
