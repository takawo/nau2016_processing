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

public class sketch_015_arc extends PApplet {

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(255, 255, 255); // \u80cc\u666f\u8272\u3092\u767d\u306b\u6307\u5b9a

  // \u5186\u5f27\u306e\u89d2\u5ea6\u8a08\u7b97\u65b9\u6cd5 0\u00b0\u3068270\u00b0\u306e\u6307\u5b9a\u65b9\u6cd5
  float startAngle = 0;
  float endAngle = TWO_PI * 270/360;

  noFill(); // \u5857\u308a\u3064\u3076\u3057\u3092\u30ca\u30b7\u306b\u6307\u5b9a
  // \u5186\u5f27\u306e\u63cf\u753b(x,y,width,height,startAngle,endAngle)
  arc(width*1/4, height/2, 200, 200, startAngle, endAngle);

  fill(0, 160, 255); // \u5857\u308a\u3064\u3076\u3057\u3092\u30ca\u30b7\u306b\u6307\u5b9a
  // \u5186\u5f27\u306e\u63cf\u753b(x,y,width,height,startAngle,endAngle)
  arc(width*2/4, height/2, 200, 200, startAngle, endAngle, CHORD);


  fill(0, 128, 255); // \u5857\u308a\u3064\u3076\u3057\u3092\u9752\u306b\u6307\u5b9a
  // \u5186\u5f27\u306e\u63cf\u753b(x,y,width,height,startAngle,endAngle,form)
  arc(width*3/4, height/2, 200, 200, startAngle, endAngle, PIE);

  // \u89d2\u5ea6\u306e\u6307\u5b9a\u65b9\u6cd5\u3068\u3001
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_015_arc" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
