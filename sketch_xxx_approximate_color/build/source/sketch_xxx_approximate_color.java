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

public class sketch_xxx_approximate_color extends PApplet {

// \u985e\u4f3c\u8272\u306e\u7b97\u51fa\u65b9\u6cd5
int num = 5;
int[] colors = new int[num];
float size;
float offset = 100;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  frameRate(60);
  rectMode(CENTER);
  size = (width-offset*2)/num;
  //println(size);
  initColor();
}

public void initColor(){
  float baseAngle = random(TWO_PI);
  float baseBrightness = random(30, 90);
  float baseSaturation = random(50, 95);
  float incAngle = random(PI/20, PI/5);
  float startAngle = baseAngle - incAngle * 2;
  println("//");
  for (int i = 0; i < num; i++) {
    float n = abs(cos((float)i/num*PI));
    float hue = degrees(startAngle + incAngle * i)%360;
    float saturation = baseSaturation + n*10f;
    float brightness = baseBrightness + n*5f;
    //println(hue, brightness, saturation);
    colors[i] = color(hue, brightness, saturation);
    println("color c" + i + " = new color(" + (int)hue + ", " + (int)brightness + ", " + (int)saturation + ");");
  }
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 0);
  noStroke();
  translate(width/2, height/2, -300);
  ambientLight(0, 0, 100);
  lights();
  for (int i = 0; i < num; i++) {
    float m = map(i, 0, num-1, -num/2f, num/2f);
    pushMatrix();
    translate(size*m, 0, 0);
    rotateX(frameCount*TWO_PI/240);
    fill(colors[i]);
    box(size);
    popMatrix();
  }
}


public void mousePressed(){
  initColor();
}
  public void settings() {  size(960, 540, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_approximate_color" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
