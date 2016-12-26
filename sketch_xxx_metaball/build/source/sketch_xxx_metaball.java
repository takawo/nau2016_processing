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

public class sketch_xxx_metaball extends PApplet {

ArrayList<Blob> blobs = new ArrayList<Blob>();
int num = 5;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
  //size(960, 540); // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  for (int i = 0; i < num; i++) {
    Blob b = new Blob(random(width), random(height));
    blobs.add(b);
  }
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0,0,100);

  loadPixels();
  int index = 0;
  float sum = 0;
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      index = x + y * width;
      sum = 0;
      for (Blob b : blobs) {
        //float d = ;
        sum += 25 * b.r / dist(x, y, b.pos.x, b.pos.y);
      }
      pixels[index] = color(0,0, 100-sum);
    }
  }
  updatePixels();
  for (Blob b : blobs) {
    b.update();
  }
}
class Blob {
  PVector pos;
  float r;
  PVector vel;
  Blob(float x, float y) {
    pos = new PVector(x, y);
    r = 40;
    vel = PVector.random2D().mult(random(2,5));
  }
  public void update() {
    pos.add(vel);

    if(pos.x > width || pos.x < 0){
      vel.x *= -1;
    }
    if(pos.y > height || pos.y < 0){
      vel.y *= -1;
    }
  }
  public void display() {
    //noFill();
    //stroke(0, 0, 100);
    //ellipse(pos.x, pos.y, r*2, r*2);
  }
}
  public void settings() {  fullScreen(P2D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_metaball" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
