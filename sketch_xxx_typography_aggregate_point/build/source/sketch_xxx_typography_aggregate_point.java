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

public class sketch_xxx_typography_aggregate_point extends PApplet {

PGraphics graphic;
ArrayList<Point> points = new ArrayList<Point>();
int grid = 15;
int backgroundColor;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
  // fullScreen();
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b

  backgroundColor = color(0, 0, 100);
  PFont font = createFont("YuGothic-Bold", 300);

  graphic = createGraphics(width, height);
  graphic.beginDraw();
  graphic.colorMode(HSB, 360, 100, 100, 100);
  graphic.background(0, 0, 100);
  graphic.textAlign(CENTER, CENTER);
  graphic.textFont(font, 300);
  graphic.fill(0, 0, 0);
  graphic.text("\u5730\u7344", width/2, height/2);
  graphic.endDraw();

  for (int y = 0; y < height; y += grid) {
    for (int x = 0; x < width; x += grid) {
      if (brightness(graphic.get(x, y)) < 1) {
        fill(0, 0, 0);
        noStroke();
        ellipse(x, y, grid, grid);
        points.add(new Point(x, y));
      }
    }
  }
  background(0, 0, 0);
}


// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  fill(0, 0, 0, 1);
  rect(0, 0, width, height);
  for (Point p : points) {
    p.update();
    p.display();
  }
}

class Point {
  PVector pos;
  PVector vel;
  Point(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
  }
  public void update() {
    pos.add(vel);
    PVector newPos = PVector.add(pos, vel);
    if (graphic.get((int)newPos.x, (int)newPos.y) == backgroundColor) {
      vel.rotate(PI);
    }
  }
  public void display() {
    fill(0, 0, 100);
    ellipse(pos.x, pos.y, 5, 5);
  }
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_typography_aggregate_point" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
