import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_xxx_Video_dot extends PApplet {



Capture cam;
int grid = 10;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  cam = new Capture(this, width, height);
  cam.start();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 100);
  //image(cam, 0, 0);
  for (int y = 0; y < cam.height; y += grid) {
    for (int x = 0; x < cam.width; x += grid) {
      int c = cam.get(x, y);
      //int a = c >> 24 & 0xFF;
      //int r = c >> 16 & 0xFF;
      //int g = c >> 8 & 0xFF;
      //int b = c & 0xFF;
      float brightness = brightness(c);
      float dot_separate = map(brightness, 0, 100, 1, grid);
      if (dot_separate >= grid) {
        continue;
      }

      for (float j = 0; j < grid; j+= dot_separate) {
        for (float i = 0; i < grid; i+= dot_separate) {
          strokeWeight(2);
          stroke(c);
          point(x+i, y+j);
        }
      }
    }
  }
}

public void captureEvent(Capture cam) {
  cam.read();
}
  public void settings() {  size(1280, 720);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_Video_dot" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
