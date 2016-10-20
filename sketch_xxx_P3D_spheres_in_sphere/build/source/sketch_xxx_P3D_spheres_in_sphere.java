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

public class sketch_xxx_P3D_spheres_in_sphere extends PApplet {

// reference: http://p5aholic.hatenablog.com/entry/2015/06/15/194250

float r = 300;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b,3D\u63cf\u753b\u30e2\u30fc\u30c9\u306b\u8a2d\u5b9a
  colorMode(HSB,360,100,100,100); // \u8272\u7a7a\u9593\u3092HSB\u306b
  sphereDetail(8); // \u7403\u306e\u89e3\u50cf\u5ea6\u3092\u6307\u5b9a
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  background(0,0,0); // \u80cc\u666f\u3092\u9ed2\u306b
  translate(width/2,height/2,-300); //\u539f\u70b9\u3092\u753b\u9762\u4e2d\u592e\u306b

  lights(); // \u30e9\u30a4\u30c6\u30a3\u30f3\u30b0

  rotateX(frameCount*0.003f); // X\u8ef8\u3092\u4e2d\u5fc3\u3068\u3057\u3066\u56de\u8ee2
  rotateY(frameCount*0.005f); // Y\u8ef8\u3092\u4e2d\u5fc3\u3068\u3057\u3066\u56de\u8ee2

  // \u5165\u308c\u5b50\u306b
  for(float angle2 = 0; angle2 < 180; angle2 += 10){
    float theta2 = radians(angle2);
    float z = cos(theta2)*r;
    for(float angle1 = 0; angle1 < 360; angle1 += 10){
      float theta1 = radians(angle1);
      float x = cos(theta1)*r*sin(theta2);
      float y = sin(theta1)*r*sin(theta2);
      pushMatrix(); // \u51e6\u7406\u524d\u306b\u539f\u70b9\u4f4d\u7f6e\u3092\u4fdd\u5b58
      translate(x,y,z); // \u63cf\u753b\u3059\u308b\u7403\u306e\u4f4d\u7f6e\u306b\u79fb\u52d5
      fill(220,80,100); // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u3092\u6307\u5b9a
      noStroke(); // \u7dda\u306e\u8272\u3092\u30ca\u30b7\u306b
      sphere(5); // \u7403\u3092\u63cf\u753b
      popMatrix(); // \u51e6\u7406\u5f8c\u306b\u4fdd\u5b58\u3057\u305f\u539f\u70b9\u4f4d\u7f6e\u306b\u5fa9\u5e30
    }
  }
}
  public void settings() {  size(960,540,P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_P3D_spheres_in_sphere" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
