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

public class sketch_xxx_Rain3 extends PApplet {

float r = 250;

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
  for (float r = 25; r < 250; r += 30) {
    for (float angle = 0; angle < 360; angle+=1) {
      float theta = radians(angle);
      float x = cos(theta) * r;
      float y = sin(theta) * r;
      noStroke();
      fill(map(r, 50, 250, 260, 190), 80, 100, 12);
      float n = noise(x/100f, y/100f, (angle+frameCount)/200f);
      n = map(norm(n, 0, 0.30f), 0, 1.0f, 0, 41);
      ellipse(x, y, n, n);
    }
  }
}
  public void settings() {  size(960, 540, P2D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_Rain3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
