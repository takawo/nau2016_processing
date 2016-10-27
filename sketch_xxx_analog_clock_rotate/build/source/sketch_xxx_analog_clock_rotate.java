import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import gifAnimation.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_xxx_analog_clock_rotate extends PApplet {



GifMaker gifMaker;
float r = 200;
public void setup() {
  
  colorMode(HSB, 360, 100, 100);
  frameRate(60);
  textAlign(CENTER, CENTER);
  textSize(20);

  gifMaker = new GifMaker(this,"export.gif");
  gifMaker.setRepeat(0);
}

public void draw() {
  int hour = hour();
  int minute = minute();
  int second = second();
  float hTheta = map(hour%12+minute/60f, 0.0f, 12.0f, 0-PI/2, TWO_PI-PI/2);
  float mTheta = map(minute+second/60f, 0.0f, 60.0f, 0-PI/2, TWO_PI-PI/2);
  float sTheta = map(second, 0, 60, 0-PI/2, TWO_PI-PI/2);
  background(0, 0, 100);
  pushMatrix();
  translate(width/2, height/2);
  float speed = radians(6)/60;
  rotate(-frameCount*speed);
  int i = 0;
  for (float theta = 0; theta < TWO_PI; theta += TWO_PI/60f) {
    if (i%5 == 0) {
      strokeWeight(5);
    } else {
      strokeWeight(2);
    }
    float x = cos(theta)*r;
    float y = sin(theta)*r;
    if (i%5 == 0 && i != 0) {
      //float x2 = cos(theta)*r*1.1;
      //float y2 = sin(theta)*r*1.1;
      fill(0, 0, 0);
      pushMatrix();
      translate(x, y);
      rotate(frameCount*speed);
      if ((i/5+3)%12 == 0) {
        text(12, 0, 0);
      } else {
        text((i/5+3)%12, 0, 0);
      }
      popMatrix();
    } else if (i != 0) {
      point(x, y);
    }
    i++;
  }
  strokeWeight(10);
  point(cos(hTheta)*r*0.5f, sin(hTheta)*r*0.5f);
  point(cos(mTheta)*r*0.8f, sin(mTheta)*r*0.8f);
  point(cos(sTheta)*r*0.9f, sin(sTheta)*r*0.9f);
  strokeWeight(20);
  point(0, 0);
  strokeWeight(3);
  line(0, 0, cos(hTheta)*r*0.5f, sin(hTheta)*r*0.5f);
  line(0, 0, cos(mTheta)*r*0.8f, sin(mTheta)*r*0.8f);
  line(0, 0, cos(sTheta)*r*0.9f, sin(sTheta)*r*0.9f);
  popMatrix();
  if (frameCount%10 == 0) {
    gifMaker.addFrame();
  }
  if (frameCount %300 == 0) {
    gifMaker.finish();
  }
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_analog_clock_rotate" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
