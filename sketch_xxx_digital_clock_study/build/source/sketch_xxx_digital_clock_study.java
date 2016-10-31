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

public class sketch_xxx_digital_clock_study extends PApplet {

int c1, c2, c3;
String psecond = "";
PFont font; // \u5909\u6570

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  font = createFont("SRM_test-Semibold", 150); //\u30a4\u30f3\u30b9\u30c8\u30fc\u30eb\u3057\u305f\u30b7\u30b9\u30c6\u30e0\u30d5\u30a9\u30f3\u30c8\u3068\u3057\u3066\u8aad\u307f\u8fbc\u307f
  textFont(font); // \u4f7f\u7528\u3059\u308b\u30d5\u30a9\u30f3\u30c8\u306b\u6307\u5b9a
  textAlign(CENTER, CENTER); // \u7e26\u6a2a\u4e2d\u592e\u63c3\u3048\u306b
  frameRate(60);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  String hour = str(100+hour()).substring(1, 3);
  String minute = str(100+minute()).substring(1, 3);
  String second = str(100+second()).substring(1, 3);
  println(psecond, second);
  if (psecond.equals(second) == false) {
    int p1 = c1;
    while (abs(hue(p1)-hue(c1))<30) {
      c1 = color(random(360), 80, 90);
      c2 = color((hue(c1)+120)%360, 80, 90);
      c3 = color((hue(c1)+240)%360, 80, 90);
    }
  }
  noStroke();
  fill(c1);
  rect(0, 0, 1/3f*width, height);
  fill(c2);
  rect(1/3f*width, 0, 1/3f*width, height);
  fill(c3);
  rect(2/3f*width, 0, 1/3f*width, height);

  fill(0, 0, 100);
  text(hour, (width/3)/2, height/2-30);
  text(minute, (width*1f/3f+width*2f/3f)/2f, height/2-30);
  text(second, (width*2f/3f+width*3f/3f)/2f, height/2-30);
  psecond = second;
  surface.setTitle(hour+":"+minute+":"+second);
}

// mouseMoved\u95a2\u6570 : \u30de\u30a6\u30b9\u304c\u30af\u30ea\u30c3\u30af\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mouseMoved() {
}

// mousePressed\u95a2\u6570 : \u30de\u30a6\u30b9\u304c\u30af\u30ea\u30c3\u30af\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mousePressed() {
}

// mouseReleased\u95a2\u6570 : \u30af\u30ea\u30c3\u30af\u304c\u89e3\u653e\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mouseReleased() {
}

// mouseDraged\u95a2\u6570 : \u30de\u30a6\u30b9\u304c\u30c9\u30e9\u30c3\u30b0\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mouseDragged() {
}
  public void settings() {  size(960, 200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_digital_clock_study" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
