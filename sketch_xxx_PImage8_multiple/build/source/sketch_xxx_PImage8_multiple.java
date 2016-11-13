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

public class sketch_xxx_PImage8_multiple extends PApplet {

int imageNum = 10;
PImage images[] = new PImage[imageNum];
int currentNum = 0;

PImage img;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  for (int i = 0; i < imageNum; i++) {
    images[i] = loadImage("city-q-c-960-540-" + i + ".jpg");
  }
  background(0, 0, 100);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  for (int i = 0; i < 1000; i++) {
    int x = (int)random(images[currentNum].width);
    int y = (int)random(images[currentNum].height);
    int c = images[currentNum].get(x, y);
    float hue = map(hue(c), 0f, 360f, 0, 1.0f);
    float saturation = map(saturation(c), 0f, 100f, 0, 1.0f);
    float brightness = map(brightness(c), 0f, 100f, 0, 1.0f);
    float normal = pow((hue + saturation + brightness)/3f,3);
    float radius = map(normal, 0f, 1f, 5, .1f);
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(c);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
  if (frameCount%500==0) {
    currentNum = (currentNum+1)%imageNum;
    //background(0, 0, 100);
  }
}

public void mousePressed() {
  currentNum = (currentNum+1)%imageNum;
  //background(0, 0, 100);
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_PImage8_multiple" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
