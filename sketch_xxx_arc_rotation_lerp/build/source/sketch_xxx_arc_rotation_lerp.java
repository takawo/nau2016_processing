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

public class sketch_xxx_arc_rotation_lerp extends PApplet {

ArrayList<Arc> arcs = new ArrayList<Arc>();
public void setup() {
  
  colorMode(HSB, 360, 100, 100, 100);
  
  noStroke();
  float r = 50;
  for (int i = 0; i < 50; i++) {
    float x = width/2;
    float y = height/2;
    float originR = random(50, 500);
    float innerR  = originR - r/2;
    float outerR  = originR + r/2;
    float originAngle = random(360);
    float angleLength = random(45, 135);
    float startAngle = (originAngle - angleLength/2)%360;
    float endAngle = (originAngle + angleLength/2)%360;
    Arc a = new Arc(x, y, innerR, outerR, startAngle, endAngle);
    arcs.add(a);
  }
}

public void draw() {
  blendMode(ADD);
  for (Arc a : arcs) {
    a.update();
    a.draw();
  }
  blendMode(BLEND);
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
}


public class Arc {
  PVector pos;
  float innerR;
  float outerR;
  float startAngle;
  float endAngle;
  float easing;
  float scaling;
  int c;
  public Arc(float x, float y, float r1, float r2, float a1, float a2) {
    pos = new PVector(x, y);
    if (r1 > r2) {
      innerR = r2;
      outerR = r1;
    } else {
      innerR = r1;
      outerR = r2;
    }
    if (a1 > a2) {
      startAngle = a2;
      endAngle = a1;
    } else {
      startAngle = a1;
      endAngle = a2;
    }
    easing = map(innerR, 0, width, 0.01f, 0.05f);
    scaling = map(sin(frameCount*(easing/100f)), -1, 1, 0.75f, 1.25f);
    c = color(startAngle, 80, 100, 50);
  }
  public void update() {
    scaling = map(sin(frameCount*easing), -1, 1, 0.7f, 1.0f);
    endAngle = (endAngle+0.2f)%360f;
    startAngle = (lerp(startAngle, endAngle, easing))%360f;
    if (abs(startAngle - endAngle) < 15) {
      startAngle = endAngle;
      float r = 50;
      float originR = random(50, 500);
      innerR  = originR - r/2;
      outerR  = originR + r/2;
      float originAngle = (endAngle+45)%360;
      float angleLength = random(45, 135);
      startAngle = (originAngle - angleLength/2)%360;
      endAngle = (originAngle + angleLength/2)%360;
    }

    c = color(startAngle, 80, 100, 50);
    fill(c);
  }
  public void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(frameCount*easing);
    scale(scaling);
    beginShape();
    for (float i = startAngle; i < endAngle; i++) {
      float x = cos(radians(i))*outerR;
      float y = sin(radians(i))*outerR;
      vertex(x, y);
    }
    for (float i = endAngle; i > startAngle; i--) {
      float x = cos(radians(i))*innerR;
      float y = sin(radians(i))*innerR;
      vertex(x, y);
    }
    endShape();
    popMatrix();
  }
}
  public void settings() {  size(960, 540, FX2D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_arc_rotation_lerp" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
