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

public class sketch_018_colorMode_HSB extends PApplet {

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b

  // \u8272\u6307\u5b9a\u3092HSB\u306e\u30ab\u30e9\u30fc\u30e2\u30fc\u30c9\u306b\u5909\u66f4 : Hue(\u8272\u76f8),Brightness(\u660e\u5ea6),Saturation(\u5f69\u5ea6)
  colorMode(HSB,360,100,100);

  // \u8272\u306e\u6307\u5b9a\u306f\u300c\u30e1\u30cb\u30e5\u30fc\u300d\uff1e\u300c\u30c4\u30fc\u30eb\u300d\uff1e\u300c\u8272\u9078\u629e\u300d\u3092\u4f7f\u3046\u3068\u4fbf\u5229
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  background(0,0,100); // \u80cc\u666f\u8272\u3092\u767d\u8272\u306b\u6307\u5b9a

  noStroke(); // \u7dda\u306e\u8272\u3092\u30ca\u30b7\u306b

  fill(140,80,100); // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u3092hsb(140,80,100)\u306b\u6307\u5b9a
  rect(-100,height/2-100,200,200);

  fill(170,80,100); // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u3092hsb(170,80,100)\u306b\u6307\u5b9a
  rect(width*1/4-100,height/2-100,200,200);

  fill(200,80,100); // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u3092hsb(200,80,100)\u306b\u6307\u5b9a
  rect(width*1/2-100,height/2-100,200,200);

  fill(230,80,100); // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u3092hsb(230,80,100)\u306b\u6307\u5b9a
  rect(width*3/4-100,height/2-100,200,200);

  fill(260,80,100); // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u3092hsb(260,80,100)\u306b\u6307\u5b9a
  rect(width-100,height/2-100,200,200);

}
  public void settings() {  size(960,540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_018_colorMode_HSB" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
