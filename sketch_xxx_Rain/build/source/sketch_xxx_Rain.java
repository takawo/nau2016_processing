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

public class sketch_xxx_Rain extends PApplet {

ArrayList<Rain> rains = new ArrayList<Rain>();
float grid = 3;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  for (float x = 0; x < width; x += grid) {
    float y = random(-200, -100);
    Rain r = new Rain(x, y);
    rains.add(r);
  }
  background(0, 0, 25);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  noStroke();
  fill(0, 0, 25, 3);
  rect(0, 0, width, height);
  for (Rain r : rains) {
    r.update();
    r.draw();
  }
}

class Rain {
  float x, y;
  float speed;
  float len;
  Rain(float _x, float _y) {
    x = _x;
    y = _y;
    speed = random(1, 2);
    len = random(10, 30);
  }
  public void update() {
    x += sin((x + y +frameCount)/100);
    y += speed;
    if (y  > height) {
      y = random(-200, -100);
    }
    if(x < 0){
      x += width;
    }
    if(x > width){
      x -= width;
    }
  }
  public void draw() {
    strokeWeight(grid);
    stroke(200, 80, 100);
    line(x, y, x, y+len);
  }
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_Rain" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
