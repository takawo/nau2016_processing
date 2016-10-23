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

public class sketch_xxx_sin_cos_circle extends PApplet {

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB,360,100,100);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  background(0,0,100); // \u80cc\u666f\u306e\u63cf\u753b
  noFill(); // \u5857\u308a\u3064\u3076\u3057\u3092\u30ca\u30b7\u306b
  stroke(0,0,0);
  line(width/2,0,width/2,height); // \u30b0\u30e9\u30d5\u306e\u63cf\u753b
  line(0,height/2,width,height/2); // \u30b0\u30e9\u30d5\u306e\u63cf\u753b
  translate(width/2,height/2); //\u539f\u70b9\u4f4d\u7f6e\u306e\u79fb\u52d5
  ellipse(0,0,400,400); //\u5186\u3092\u63cf\u753b

  // \u539f\u70b9\uff08\u753b\u9762\u4e2d\u5fc3\u304b\u3089\u89b3\u305f\u30de\u30a6\u30b9\u4f4d\u7f6e\u306e\u89d2\u5ea6\u3092\u8a08\u7b97\uff09
  float theta = atan2(mouseY-height/2,mouseX-width/2);

  // \u5186\u5468\u4e0a\u306e\u70b9\u306e\u8a08\u7b97
  float x = cos(theta)* 200;
  float y = sin(theta)* 200;
  float t = tan(theta)* 200;

  //
  stroke(220,80,100);
  line(0,0,x,y);

  stroke(0,80,100);
  line(x,0,x,y);
  line(0,y,x,y);


  noStroke();
  fill(150,80,100);
  ellipse(x,y,20,20);


}
  public void settings() {  size(960,540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_sin_cos_circle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
