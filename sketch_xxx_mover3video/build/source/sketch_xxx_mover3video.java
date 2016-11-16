import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_xxx_mover3video extends PApplet {



Capture cam;
float diameter = 5;
ArrayList<Point> points;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u30921280px,720px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  cam = new Capture(this,640,360);
  cam.start();
  frameRate(60);
  points = new ArrayList<Point>();
  for (int x = 0; x <= width; x += diameter) {
    for (int i = 0; i < 20; i++) {
      points.add(new Point(x, random(height)));
    }
  }
  background(0, 0, 10);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  if(cam.available()){
    cam.read();
  }
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  for (Point point : points) {
    point.update();
    point.display();
  }
  image(cam,20,20,16 * 15, 9 * 15);
}

class Point {
  PVector pos;
  PVector vel;
  PVector left = new PVector(-1, 0);
  PVector right = new PVector(1, 0);
  boolean isLeft = false;
  boolean isRight = false;
  int counter = 0;
  int c;
  Point(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, random(-1,-2.5f));
    c = cam.get((int)x/2,(int)y/2);
  }
  public void update() {
    if (random(1) < 0.005f && isLeft == false && isRight == false) {
      isLeft = true;
    }
    if (random(1) > 0.995f && isRight == false && isLeft == false) {
      isRight = true;
    }
    if (isLeft && counter < diameter) {
      pos.add(left);
      counter++;
    }
    if (isRight && counter < diameter) {
      pos.add(right);
      counter++;
    }
    if (counter >= diameter) {
      counter = 0;
      isLeft = false;
      isRight = false;
      changeColor();
    }


    pos.add(vel);
    if (pos.x < 0) {
      pos.x += width;
      changeColor();
    }
    if (pos.x > width) {
      pos.x -= width;
      changeColor();
    }
    if (pos.y < 0) {
      pos.y += height;
      changeColor();
    }
    if (pos.y > height) {
      pos.x -= height;
      changeColor();
    }
  }
  public void changeColor(){
    c = cam.get((int)pos.x/2,(int)pos.y/2);
  }

  public void display() {
    fill(c);
    noStroke();
    ellipse(pos.x, pos.y, diameter, diameter);
  }
}
  public void settings() {  size(1280, 720);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_mover3video" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
