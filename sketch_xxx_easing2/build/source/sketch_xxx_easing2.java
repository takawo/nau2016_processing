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

public class sketch_xxx_easing2 extends PApplet {

// \u5909\u6570
float x,y; // \u3053\u3093\u306a\u98a8\u306b\u5ba3\u8a00\u3082\u51fa\u6765\u308b
float sx,ex,tx;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB,360,100,100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  rectMode(CENTER);

  sx = 100;
  ex = width-sx;

  x = sx;
  y = height/2;
  tx = ex;
  background(0,0,100);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  fill(0,0,100,3); // \u80cc\u666f\u3092\u767d\u306b
  rect(width/2,height/2,width,height);

  fill(220,80,100); // \u5857\u308a\u3064\u3076\u3057\u3092\u9752\u306b
  noStroke(); // \u7dda\u306e\u63cf\u753b\u3092\u30ca\u30b7\u306b
  float t = (frameCount%200)/200f; // t\u30920.0-1.0\u306e\u9593\u3067\u7e70\u308a\u8fd4\u3057\u5897\u52a0
  if(t == 0){ // t\u304c0\u306b\u306a\u3063\u305f\u3068\u304d
    float temp;
    if(x == 100){
      x = sx;
      tx = ex;
    }else{
      x = ex;
      tx = sx;
    }
  }
  // \u30a4\u30fc\u30b8\u30f3\u30b0\u306e\u95a2\u6570lerp : \u59cb\u70b9\u306e\u5024x\u3068\u7d42\u70b9\u306e\u5024tx\u306e\u9593\u3067\u3001\u5272\u5408t(0.0-1.0)\u3067\u4f4d\u7f6e\u3092\u6c7a\u3081\u308b
  x = lerp(x,tx,t);
  rect(x,y,50,50);

}

// mouseMoved\u95a2\u6570 : \u30de\u30a6\u30b9\u304c\u30af\u30ea\u30c3\u30af\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mouseMoved(){

}

// mousePressed\u95a2\u6570 : \u30de\u30a6\u30b9\u304c\u30af\u30ea\u30c3\u30af\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mousePressed(){

}

// mouseReleased\u95a2\u6570 : \u30af\u30ea\u30c3\u30af\u304c\u89e3\u653e\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mouseReleased(){

}

// mouseDraged\u95a2\u6570 : \u30de\u30a6\u30b9\u304c\u30c9\u30e9\u30c3\u30b0\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mouseDragged(){

}
  public void settings() {  size(960,540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_easing2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
