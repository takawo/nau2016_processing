import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import geomerative.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_extra_geomerative_text extends PApplet {

// geomerative\u30e9\u30a4\u30d6\u30e9\u30ea\u306e\u8aad\u307f\u8fbc\u307f


//RShape\u30af\u30e9\u30b9\u306e\u30aa\u30d6\u30b8\u30a7\u30af\u30c8
RShape shape;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u306e\u8272\u7a7a\u9593\u3092\u6307\u5b9a

  background(0, 0, 100);
  // geomerative\u30e9\u30a4\u30d6\u30e9\u30ea\u306e\u521d\u671f\u5316
  RG.init(this);
  // shape\u306b\u30c6\u30ad\u30b9\u30c8\u3001\u30d5\u30a9\u30f3\u30c8\u3001\u30d5\u30a9\u30f3\u30c8\u30b5\u30a4\u30ba\u3001\u884c\u63c3\u3048\u3092\u6307\u5b9a\u3057\u3066\u30a4\u30f3\u30b9\u30bf\u30f3\u30b9\u5316
  shape = RG.getText("\u65e5\u672c\u8a9e\u30c6\u30ad\u30b9\u30c8", "GenShinGothic-P-Heavy.ttf", 72, CENTER);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 100); // \u80cc\u666f\u3092\u767d\u8272\u306b
  fill(220, 80, 100); // \u5857\u308a\u3064\u3076\u3057\u3092\u9752\u8272\u306b
  stroke(0, 0, 0); // \u7dda\u306e\u8272\u3092\u9ed2\u8272\u306b
  strokeWeight(1); // \u7dda\u306e\u592a\u3055\u3092\u6307\u5b9a

  translate(width/2, height/2); // \u539f\u70b9\u3092\u753b\u9762\u4e2d\u592e\u306b\u79fb\u52d5
  shape.draw(); // \u30c6\u30ad\u30b9\u30c8\u3092\u63cf\u753b
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_extra_geomerative_text" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
