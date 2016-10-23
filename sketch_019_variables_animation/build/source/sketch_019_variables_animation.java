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

public class sketch_019_variables_animation extends PApplet {

// \u5909\u6570

int x = 0;
int loopX = 0;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); //\u30ab\u30e9\u30fc\u30e2\u30fc\u30c9\u3092HSB\u306b
  noStroke();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  //H:0,S:0,B:100\uff08\u5f69\u5ea6\u304c0\u3067\u660e\u308b\u3055\u304c100\u306a\u306e\u3067\u3001\u8272\u76f8\u306b\u95a2\u4fc2\u306a\u304f\u767d\uff09
  background(0, 0, 100);

  // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u3092\u6307\u5b9a
  fill(60, 80, 100); // \u9ec4\u8272
  rect(x, 100, 150, 150); //\u77e9\u5f62\u3092\u63cf\u753b

  // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u3092\u6307\u5b9a
  fill(240, 80, 100); // \u9752\u8272
  rect(loopX, 300, 150, 150); //\u77e9\u5f62\u3092\u63cf\u753b

  // \u52a0\u7b97\u306e\u66f8\u304d\u65b9
  x = x + 5; // x\u306e\u5024\u30921\u305a\u3064\u5897\u3084\u3059
  // x = x + 1; \u306f\u6b21\u306e\u3088\u3046\u306b\u3082\u66f8\u3051\u308b
  // x++;
  // x += 1;

  // \u6570\u5024\u3092\u7e70\u308a\u8fd4\u3059\u624b\u6cd5\uff1a\u5270\u4f59\u3092\u4f7f\u3046
  loopX = loopX + 1; // loopX\u306e\u5024\u30921\u305a\u3064\u5897\u3084\u3059
  // loopX\u304c\u753b\u9762\u5e45\u3088\u308a\u51fa\u305f\u3068\u304d0\u306b\u623b\u3059
  //\uff08width\u3067\u5272\u3063\u305f\u4f59\u308a\u304c\u4ee3\u5165\u3055\u308c\u308b\uff09
  loopX = loopX%width;
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_019_variables_animation" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
