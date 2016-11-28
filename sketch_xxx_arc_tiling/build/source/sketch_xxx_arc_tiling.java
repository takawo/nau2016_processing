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

public class sketch_xxx_arc_tiling extends PApplet {

float grid = 10;
PImage img;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  img = loadImage("lena_color.jpg");

  fill(0, 0, 10);
  noStroke();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 0);
  for (float y = 0; y < width; y += grid) {
    for (float x = 0; x < width; x += grid) {
      pushMatrix();
      translate(x, y);
      int c = img.get(PApplet.parseInt(x), PApplet.parseInt(y));
      drawArc(c);
      popMatrix();
    }
  }
  noLoop();
}

public void mousePressed() {
  redraw();
}

public void drawArc(int c) {
  fill(c);
  float brightness = brightness(c);
  float thickness = map(brightness, 0, 100, 0, grid/2);
  float random = ((1-random(1)) +(1-random(1)) +(1-random(1)) +(1-random(1)) +(1-random(1)))/5;
  int n = 1 + (int)(random* 4f);
  switch(n) {
  case 0:
    break;
  case 1:
    pushMatrix();
    translate(0, grid);
    rotate(-PI/2);
    beginShape();
    for (float angle = 0; angle <= 90; angle++) {
      float theta = radians(angle);
      float x = cos(theta) * grid;
      float y = sin(theta) * grid;
      vertex(x, y);
    }
    for (float angle = 90; angle >= 0; angle--) {
      float theta = radians(angle);
      float x = cos(theta) * (grid - thickness);
      float y = sin(theta) * (grid - thickness);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    break;
  case 2:
    pushMatrix();
    translate(0, 0);
    rotate(0);
    beginShape();
    for (float angle = 0; angle <= 90; angle++) {
      float theta = radians(angle);
      float x = cos(theta) * grid;
      float y = sin(theta) * grid;
      vertex(x, y);
    }
    for (float angle = 90; angle >= 0; angle--) {
      float theta = radians(angle);
      float x = cos(theta) * (grid - thickness);
      float y = sin(theta) * (grid - thickness);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    break;
  case 3:
    pushMatrix();
    translate(grid, 0);
    rotate(PI/2);
    beginShape();
    for (float angle = 0; angle <= 90; angle++) {
      float theta = radians(angle);
      float x = cos(theta) * grid;
      float y = sin(theta) * grid;
      vertex(x, y);
    }
    for (float angle = 90; angle >= 0; angle--) {
      float theta = radians(angle);
      float x = cos(theta) * (grid - thickness);
      float y = sin(theta) * (grid - thickness);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    break;
  case 4:
    pushMatrix();
    translate(grid, grid);
    rotate(PI);
    beginShape();
    for (float angle = 0; angle <= 90; angle++) {
      float theta = radians(angle);
      float x = cos(theta) * grid;
      float y = sin(theta) * grid;
      vertex(x, y);
    }
    for (float angle = 90; angle >= 0; angle--) {
      float theta = radians(angle);
      float x = cos(theta) * (grid - thickness);
      float y = sin(theta) * (grid - thickness);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    break;
  }
}
  public void settings() {  size(512, 512);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_arc_tiling" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
