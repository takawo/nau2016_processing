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

public class sketch_xxx_concentric_circle extends PApplet {

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 0);
  translate(width/2, height/2);
  float r = 200;
  noFill();
  strokeWeight(1);
  stroke(0, 0, 100, 50);
  ellipse(0, 0, r*2, r*2);
  int i = 0;
  for (float angle =0; angle < 360; angle += 10) {
    float theta = radians(angle);
    float x1 = cos(theta) * r;
    float y1 = sin(theta) * r;
    float x2 = cos(theta + PI) * r;
    float y2 = sin(theta + PI) * r;
    strokeWeight(5);
    point(x1, y1);
    point(x2, y2);
    strokeWeight(1);
    line(x1, y1, x2, y2);
    float startN = 0;
    float endN = 1.0f;
    if(i%2 == 0){
      startN = 0.05f;
    }
    for (float n = startN; n < endN; n+= 0.1f) {
      float x3 = lerp(x1, x2, n);
      float y3 = lerp(y1, y2, n);
      strokeWeight(5);
      point(x3, y3);
    }
    i++;
  }
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_concentric_circle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
