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

public class sketch_xxx_sin_cos extends PApplet {

float freq;
float amp;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u306e\u8272\u6307\u5b9a\u306b
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 100);
  translate(0, height/2);

  freq = map(mouseX, 0, 960, 0.001f, 0.15f);
  amp = map(mouseY, 0, height, 200, 100);
  stroke(0, 0, 0);
  line(0, 0, width, 0);
  float y = 0;
  float px = 0;
  float py = 0;
  stroke(220, 80, 100);
  for (float x = 0; x < width; x += 1) {
    y = sin((x+frameCount)*freq)*amp;
    line(x, y, px, py);
    px = x;
    py = y;
  }
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_sin_cos" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
