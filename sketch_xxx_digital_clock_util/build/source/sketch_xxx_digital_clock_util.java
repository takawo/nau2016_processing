import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_xxx_digital_clock_util extends PApplet {



public void setup() {
  
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

public void draw() {
  background(0, 0, 0);
  noStroke();
  Calendar calendar = Calendar.getInstance();
  float h = map(calendar.get(Calendar.HOUR_OF_DAY), 0, 23, 0, width);
  float m = map(calendar.get(Calendar.MINUTE), 0, 59, 0, width);
  float s = map(calendar.get(Calendar.SECOND), 0, 59, 0, width);
  float m2 = map(calendar.get(Calendar.MILLISECOND), 0, 999, 0, width);
  fill(0,100,100);
  rect(0, height*0/4, h, height*1/4);
  fill(90,100,100);
  rect(0, height*1/4, m, height*1/4);
  fill(180,100,100);
  rect(0, height*2/4, s, height*1/4);
  fill(270,100,100);
  rect(0, height*3/4, m2, height*1/4);
  drawMeasure(0, height*0/4, width, height*1/4,23);
  drawMeasure(0, height*1/4, width, height*1/4,59);
  drawMeasure(0, height*2/4, width, height*1/4,59);
  drawMeasure(0, height*3/4, width, height*1/4,99);
}

  public void drawMeasure(float x, float y, float w, float h, float divisions) {
  float len = w-x;
  float scale = len/divisions;
  for (float i = x; i < w; i+= scale) {
    stroke(0, 0, 0);
    strokeWeight(1);
    line(i, y, i, y+h);
  }
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_digital_clock_util" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
