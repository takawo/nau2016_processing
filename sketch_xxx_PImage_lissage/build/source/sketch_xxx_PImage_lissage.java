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

public class sketch_xxx_PImage_lissage extends PApplet {

ArrayList<Lissage> lissages = new ArrayList<Lissage>();
float size = 20;
PImage img;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  background(0, 0, 100);
  img = loadImage("city-q-c-960-540-3.jpg");
  for (float y = 0; y < height; y += size) {
    for (float x = 0; x < width; x += size) {
      int c = img.get((int)x, (int)y);
      Lissage l = new Lissage(x, y, size, c);
      lissages.add(l);
    }
  }
  background(0, 0, 100);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  for (Lissage l : lissages) {
    l.update();
    l.draw();
  }
}
class Lissage {
  float cx;
  float cy;
  float grid;
  float x;
  float y;
  float tx, ty;
  float inc;
  float t = random(TWO_PI);
  int c;
  boolean isFirst = true;
  Lissage(float _cx, float _cy, float _grid, int _c) {
    cx = _cx;
    cy = _cy;
    grid = _grid;
    float brightness = brightness(c);
    float saturation = saturation(c);
    tx = map(brightness, 0, 100, 1f, 20f);
    ty = random(-5,5);
    c = _c;
    inc = 0.01f;
  }
  public void update() {
    t += inc;
  }

  public void draw() {
    //rect(cx,cy,grid,grid);
    fill(c);
    noStroke();
    pushMatrix();
    translate(cx + grid/2, cy+ grid/2);
    ellipse(x(t), y(t), 1, 1);
    popMatrix();
  }

  public float x(float t) {
    return cos(t/tx) * grid/2;
  }

  public float y(float t) {
    return sin(t/ty) * grid/2;
  }
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_PImage_lissage" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
