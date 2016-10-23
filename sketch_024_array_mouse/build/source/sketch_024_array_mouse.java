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

public class sketch_024_array_mouse extends PApplet {

// \u5909\u6570
int num = 100; // \u914d\u5217\u306e\u500b\u6570
int[] posX = new int[num]; // mouseX\u306e\u6570\u5024\u3092\u683c\u7d0d\u3057\u3066\u3044\u304f\u914d\u5217
int[] posY = new int[num]; // mouseY\u306e\u6570\u5024\u3092\u683c\u7d0d\u3057\u3066\u3044\u304f\u914d\u5217

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB,360,100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  frameRate(60);

  // \u914d\u5217\u306e\u521d\u671f\u5316
  for(int i = 0; i < num; i++){
    posX[i] = 0;
    posY[i] = 0;
  }
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  background(0,0,100);

  for(int j = num-1; j > 0; j-- ){
    posX[j] = posX[j-1];
    posY[j] = posY[j-1];
  }
  posX[0] = mouseX;
  posY[0] = mouseY;

  for(int i = 0; i < num-1; i++){
    float sw = map(i,0,num-1,5f,1f);
    strokeWeight(sw);
    line(posX[i],posY[i],posX[i+1],posY[i+1]);
  }
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
    String[] appletArgs = new String[] { "sketch_024_array_mouse" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
