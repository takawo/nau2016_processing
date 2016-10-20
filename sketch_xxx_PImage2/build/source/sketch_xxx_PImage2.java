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

public class sketch_xxx_PImage2 extends PApplet {

PImage img;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100);
  noStroke();
  img = loadImage("lena_color.jpg"); //\u753b\u50cf\u3092\u8aad\u307f\u8fbc\u307f
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  // \u80cc\u666f\u3092\u767d\u306b
  background(0, 0, 100);

  int grid = 5;
  //int grid = int(noise(frameCount*0.03)*50);

  // img\u306e\u5404\u30d4\u30af\u30bb\u30eb\u306b\u30a2\u30af\u30bb\u30b9\u3057\u3066\u8272\u60c5\u5831\u3092\u53d6\u5f97
  for (int y = 0; y < img.height; y += grid) {
    for (int x = 0; x < img.width; x += grid) {
      // \u753b\u50cf\u306e\u30d4\u30af\u30bb\u30eb\u304b\u3089\u8272\u60c5\u5831\u3092\u53d6\u5f97
      int c = img.get(x, y);
      // \u8272\u6307\u5b9a
      stroke(c);
      // \u5927\u304d\u3055\u3092\u6307\u5b9a
      strokeWeight(grid);
      // \u70b9\u3092\u63cf\u753b
      point(x, y);
    }
  }

  image(img,512,0);
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_PImage2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
