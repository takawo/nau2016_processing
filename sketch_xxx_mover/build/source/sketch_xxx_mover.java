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

public class sketch_xxx_mover extends PApplet {

int num = 100;
ArrayList<Mover> movers = new ArrayList<Mover>();
public void setup() {
  
  
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(30);
  background(220, 50, 25);
  for (int i = 0; i < num; i++) {
    movers.add(new Mover());
  }
}

public void draw() {
  fill(0, 0, 25, 10);
  //rect(0,0,width,height);
  stroke(220, 50, 100);
  strokeWeight(1.5f);
  fill(250, 100, 100);
  translate(width/2, height/2);
  for (Mover m : movers) {
    m.update();
    m.draw();
  }
}

class Mover {
  float startNoise;
  float startRadian;
  float radian;
  float radius;
  float x;
  float y;
  public Mover() {
    startNoise = random(100);
    startRadian = random(TWO_PI);
  }

  public void update() {
    radius = 100 + 100 * map(noise(startNoise + frameCount* 0.03f), 0.0f, 1.0f, -1.0f, 1.0f);
    radian = startRadian + frameCount * 0.05f;
    x = cos(radian) * radius;
    y = sin(radian) * radius;
  }

  public void draw() {
    ellipse(x, y, 10, 10);
  }
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_mover" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
