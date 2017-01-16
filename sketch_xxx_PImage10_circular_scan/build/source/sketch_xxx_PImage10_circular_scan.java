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

public class sketch_xxx_PImage10_circular_scan extends PApplet {

PImage img;
ArrayList<Float> thetas = new ArrayList<Float>();
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
  
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  img = loadImage("lena_color.jpg");
  for (int r = 10; r < width; r += 10) {
    thetas.add(map(r,10,width,0,PI));
  }
  background(0, 0, 100);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  int i = 0;
  for (int r = 10; r < width; r += 10) {
    float theta = thetas.get(i);
    int x = PApplet.parseInt(cos(theta) * r + width/2);
    int y = PApplet.parseInt(sin(theta) * r + height/2);
    int c = img.get(x, y);
    float b = brightness(c);
    float radius = map(b, 0, 100, 5, 0);
    noStroke();
    fill(c);
    ellipse(x, y, radius, radius);
    thetas.set(i, theta+0.01f);
    i++;
  }
}
  public void settings() {  size(512, 512);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_PImage10_circular_scan" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
