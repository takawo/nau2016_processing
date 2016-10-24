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

public class sketch_xxx_P3D_tunnel extends PApplet {

// \u5909\u6570

float distance = 0f;
float speed = 5;
float objStep = 40;

int backgroundColor,strokeColor;
boolean useRect;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB,360,100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  rectMode(CENTER);

  mousePressed();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  background(backgroundColor);
  translate(width/2,height/2);
  float camX = map(mouseX,0,width,-150,150);
  float camY = map(mouseY,0,height,-150,150);

  camera(camX,camY,0,0,0,-100,0,1,0);
  stroke(strokeColor);
  strokeWeight(2);
  noFill();

  for(float depth = 0; depth > -1500; depth -= objStep){
    pushMatrix();
    translate(0,0,depth + distance%objStep);
    if(useRect){
      rect(0,0,200,200);
    }else{
      ellipse(0,0,200,200);
    }
    popMatrix();
  }
  distance += speed;
  if(distance > objStep){
    distance -= objStep;
  }

}

// mouseMoved\u95a2\u6570 : \u30de\u30a6\u30b9\u304c\u30af\u30ea\u30c3\u30af\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mouseMoved(){

}

// mousePressed\u95a2\u6570 : \u30de\u30a6\u30b9\u304c\u30af\u30ea\u30c3\u30af\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mousePressed(){
  backgroundColor = color(random(360),80,random(10,50));
  strokeColor = color((hue(backgroundColor)+180)%360,80,100);
  useRect = random(1) < 0.5f ? true : false;
}

// mouseReleased\u95a2\u6570 : \u30af\u30ea\u30c3\u30af\u304c\u89e3\u653e\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mouseReleased(){

}

// mouseDraged\u95a2\u6570 : \u30de\u30a6\u30b9\u304c\u30c9\u30e9\u30c3\u30b0\u3055\u308c\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mouseDragged(){

}
  public void settings() {  size(960,540,P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_P3D_tunnel" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
