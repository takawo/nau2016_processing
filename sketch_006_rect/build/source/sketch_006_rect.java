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

public class sketch_006_rect extends PApplet {

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   //\u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  // \u80cc\u666f\u8272\u3092\u6307\u5b9a(R,G,B)
  background(255,255,255); //RGB\u306f\u54040-255\u306e\u6570\u5024\u3067\u8272\u3092\u6307\u5b9a\u3059\u308b

  // \u77e9\u5f62\uff08\u76f4\u89d2\u306a\u56db\u89d2\u5f62\uff09\u3092\u63cf\u753b
  rect(380,170,200,200); //x,y,\u5e45,\u9ad8\u3055\u3092\u6307\u5b9a
}
  public void settings() {  size(960,540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_006_rect" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
