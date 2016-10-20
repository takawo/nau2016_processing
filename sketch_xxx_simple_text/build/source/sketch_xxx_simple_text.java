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

public class sketch_xxx_simple_text extends PApplet {

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 100);

  fill(0, 0, 0); //\u5857\u308a\u3064\u3076\u3057(\u6587\u5b57)\u306e\u8272\u3092\u9ed2\u306b
  textAlign(LEFT, TOP); //\u6587\u5b57\u306e\u884c\u63c3\u3048\u3092\u5de6\u63c3\u3048\u3001\u4e0a\u63c3\u3048\u306b
  text("Here is Left/Top.", 20, 20); //x=20,y=20\u306e\u4f4d\u7f6e\u306b\u30c6\u30ad\u30b9\u30c8\u3092\u8868\u793a

  fill(0, 100, 100);
  // x=20,y=20\u306b\u5186\u3092\u63cf\u753b
  ellipse(20, 20, 5, 5);

  fill(0, 0, 0); //\u5857\u308a\u3064\u3076\u3057(\u6587\u5b57)\u306e\u8272\u3092\u9ed2\u306b
  textAlign(CENTER, CENTER); //\u6587\u5b57\u306e\u884c\u63c3\u3048\u3092\u4e2d\u592e\u63c3\u3048\u306b
  text("Here is Center/Center.", width/2, height/2); //\u753b\u9762\u4e2d\u592e\u306e\u4f4d\u7f6e\u306b\u30c6\u30ad\u30b9\u30c8\u3092\u8868\u793a

  fill(240, 100, 100);
  // \u753b\u9762\u4e2d\u592e\u306b\u5186\u3092\u63cf\u753b
  ellipse(width/2, height/2, 5, 5);

  fill(0, 0, 0); //\u5857\u308a\u3064\u3076\u3057(\u6587\u5b57)\u306e\u8272\u3092\u9ed2\u306b
  textAlign(RIGHT, BOTTOM); //\u6587\u5b57\u306e\u884c\u63c3\u3048\u3092\u53f3\u63c3\u3048\u3001\u4e0b\u63c3\u3048\u306b
  text("Here is Right/Bottom.", width-20, height-20); //x=width-20,y=height-20\u306e\u4f4d\u7f6e\u306b\u30c6\u30ad\u30b9\u30c8\u3092\u8868\u793a

  fill(120, 100, 100);
  // x=width-20,y=height-20\u306b\u5186\u3092\u63cf\u753b
  ellipse(width-20, height-20, 5, 5);
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_simple_text" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
