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

public class sketch_xxx_circle2square2 extends PApplet {

// color reference : https://goo.gl/31Q13x

int num = 100;
ArrayList<Box> boxes = new ArrayList<Box>();

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  float sizeGrid = random(40, 60);
  for (float y = 0; y <= height; y += sizeGrid) {
    for (float x = 0; x <= width; x += sizeGrid) {
      Box box = new Box(sizeGrid/2 + x, sizeGrid/2 + y, sizeGrid);
      boxes.add(box);
    }
  }
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  fill(206, 72, 47, 50);
  rect(0, 0, width, height);
  for (Box b : boxes) {
    b.update();
    b.display();
  }
}

class Box {
  float x, y;
  float sizeGrid;
  float easing;
  float sizeMin;
  float sizeMax;
  boolean isForward;
  float sizeCurrent;
  int c;
  int[] colors = {color(186, 87, 64), color(182, 29, 95), color(85, 11, 100), color(32, 100, 92)};
  Box(float _x, float _y, float _sizeGrid) {
    x = _x;
    y = _y;
    sizeGrid = _sizeGrid/2;
    easing = random(0.01f, 0.1f);
    sizeMin = 0;
    sizeMax = sqrt(sizeGrid * sizeGrid + sizeGrid * sizeGrid);
    c = colors[PApplet.parseInt(random(colors.length))];
    if (random(1) > 0.5f) {
      isForward = true;
      sizeCurrent = sizeMin;
    } else {
      isForward = false;
      sizeCurrent = sizeMax;
    }
  }

  public void update() {
    float sizeTarget;
    if (isForward) {
      sizeTarget = sizeMax;
    } else {
      sizeTarget = sizeMin;
    }
    sizeCurrent = lerp(sizeCurrent, sizeTarget, easing);
    if (abs(sizeCurrent - sizeTarget) < 1) {
      if (isForward) {
        sizeTarget = random(sizeMin, sizeMin+sizeMax/10);
      } else {
        sizeTarget = random(sizeMax/4, sizeMax);
        c = colors[PApplet.parseInt(random(colors.length))];
      }
      isForward = !isForward;
      easing = random(0.05f, 0.1f);
    }
  }

  public void display() {
    noStroke();
    fill(c);
    pushMatrix();
    translate(x, y);
    beginShape();
    for (float angle = 0; angle < 360; angle += 10) {
      float theta = radians(angle);
      float x1 = cos(theta) * sizeCurrent;
      float y1 = sin(theta) * sizeCurrent;
      x1 = constrain(x1, -sizeGrid, sizeGrid);
      y1 = constrain(y1, -sizeGrid, sizeGrid);
      vertex(x1, y1);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_circle2square2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
