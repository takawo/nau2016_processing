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

public class sketch_xxx_P3D_spheres_in_sphere2 extends PApplet {

// reference: http://p5aholic.hatenablog.com/entry/2015/06/15/194250

int numPoints = 1000;
float[] xPos = new float[numPoints];
float[] yPos = new float[numPoints];
float[] zPos = new float[numPoints];

public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b,3D\u63cf\u753b\u30e2\u30fc\u30c9\u306b\u8a2d\u5b9a
  colorMode(HSB,360,100,100,100); // \u8272\u7a7a\u9593\u3092HSB\u306b
  sphereDetail(8); // \u7403\u306e\u89e3\u50cf\u5ea6\u3092\u6307\u5b9a
  // \u534a\u5f84200\u306e\u7403\u4f53\u4e0a\u306b\u70b9\u3092\u30e9\u30f3\u30c0\u30e0\u306b\u914d\u7f6e
  for(int i = 0; i < numPoints; i++){
    float radianS = radians(random(180));
    float radianT = radians(random(360));
    xPos[i] = 200 * sin(radianS) * cos(radianT);
    yPos[i] = 200 * sin(radianS) * sin(radianT);
    zPos[i] = 200 * cos(radianS);

    /*
    x = sin(radianS) * cos(radianT)
    y = sin(radianS) * sin(radianT)
    z = cos(radianS)
    \u306f\u3001\u534a\u5f841\u306e\u7403\u4f53\u306e\u5ea7\u6a19\u3092\u8a08\u7b97\u3057\u3066\u3044\u308b\u3053\u3068\u306b\u306a\u308b
    */
  }
  background(0,0,0);
}

public void draw(){
  pushMatrix();
  ambientLight(0,0,100); // \u767d\u8272\u306e\u30a2\u30f3\u30d3\u30a8\u30f3\u30c8\u30e9\u30a4\u30c8
  translate(width/2, height/2, 0); // \u5ea7\u6a19\u3092\u539f\u70b9\u3078\u79fb\u52d5
  rotateX(frameCount*0.003f);
  rotateZ(frameCount*0.007f);

  for(int i = 0; i < numPoints; i++){
    pushMatrix(); // \u51e6\u7406\u524d\u306b\u539f\u70b9\u4f4d\u7f6e\u3092\u4fdd\u5b58
    translate(xPos[i], yPos[i], zPos[i]); // \u63cf\u753b\u3059\u308b\u7403\u306e\u4f4d\u7f6e\u306b\u79fb\u52d5
    fill(220,80,100); // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u3092\u6307\u5b9a
    noStroke(); // \u7dda\u306e\u8272\u3092\u30ca\u30b7\u306b
    sphere(2); // \u7403\u3092\u63cf\u753b
    popMatrix(); // \u51e6\u7406\u5f8c\u306b\u4fdd\u5b58\u3057\u305f\u539f\u70b9\u4f4d\u7f6e\u306b\u5fa9\u5e30
  }
  fill(0,0,0,5);
  popMatrix();
  rect(0,0,width,height);
}
  public void settings() {  size(960,540,P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_P3D_spheres_in_sphere2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
