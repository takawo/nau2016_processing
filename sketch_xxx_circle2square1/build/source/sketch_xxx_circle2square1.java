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

public class sketch_xxx_circle2square1 extends PApplet {

float size;
float sizeMin = 0;
float sizeMax = sqrt(100 * 100 + 100 * 100);

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
  rectMode(CENTER);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  // \u80cc\u666f\u3092\u767d\u306b
  background(0, 0, 50);
  // \u753b\u9762\u306e\u4e2d\u5fc3\u306b
  translate(width/2, height/2);

  // \u534a\u5f84\u3092\u30de\u30a6\u30b9\u4f4d\u7f6e\u306b\u5fdc\u3058\u306630-300\u306e\u7bc4\u56f2\u306b\u6307\u5b9a
  float size = map(sin(frameCount*0.1f), -1, 1, sizeMin, sizeMax);

  beginShape();
  for (float angle = 0; angle < 360; angle += 1f) {
    float theta = radians(angle);
    float x = cos(theta) * size;
    float y = sin(theta) * size;
    x = constrain(x, -100f, 100f);
    y = constrain(y, -100f, 100f);
    vertex(x, y);
  }
  endShape(CLOSE);

}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_circle2square1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
