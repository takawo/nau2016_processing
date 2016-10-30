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

public class sketch_xxx_for_tiling_odd_even extends PApplet {

// \u5909\u6570
float grid = 100;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB,360,100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  int counter = 0;
  for(float y = 0; y < height; y += grid){
    counter++;
    if(counter%2==0){
      // even \u5076\u6570\u306e\u3068\u304d
      for(float x = 0; x < width; x += grid ){
        float hue = noise(x/100f,y/100f,frameCount/100f)*360;
        int c = color(hue,80,100);
        fill(c);
        rect(x,y,grid,grid);
      }
    }else{
      for(float x = -grid/2; x < width+grid/2; x += grid ){
        // even \u5076\u6570\u306e\u3068\u304d
        float hue = noise(x/100f,y/100f,frameCount/100f)*360;
        int c = color(hue,80,100);
        fill(c);
        rect(x,y,grid,grid);
      }
    }
  }
}
  public void settings() {  size(960,540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_for_tiling_odd_even" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
