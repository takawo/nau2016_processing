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

public class sketch_xxx_wave extends PApplet {

int num = 5;
ArrayList<Waves> ws;

public void setup() {
  
  colorMode(HSB, 360, 100, 100);
  frameRate(30);
  
  ws = new ArrayList<Waves>();
  for (int i = 0; i < num+1; i++) {
    ws.add(new Waves(height/num*i));
  }
}

public void draw() {
  background(0, 0, 100);
  for (Waves w : ws) {
    w.draw();
  }
}

public class Waves {
  Wave wave1;
  Wave wave2;
  float y;
  public Waves(float y) {
    wave1 = new Wave();
    wave2 = new Wave();
    this.y = y;
  }
  public void draw() {
    pushMatrix();
    translate(0, y);
    noFill();
    stroke(220, 80, 100);
    strokeWeight(4);

    beginShape();
    for (int x = 0; x <= width; x++) {
      float a = x * 0.01f + frameCount*0.1f;
      float h = wave1.getValue(a);
      vertex(x, h);
    }
    endShape();
    beginShape();
    for (int x = 0; x <= width; x++) {
      float a = x * 0.01f + frameCount*0.1f;
      float h = wave2.getValue(a);
      vertex(x, h);
    }
    endShape();

    strokeWeight(2);
    for (int x = 0; x <= width; x+= 5) {
      float a = x * 0.01f + frameCount*0.1f;
      float h1 = wave1.getValue(a);
      float h2 = wave2.getValue(a);
      line(x, h1, x, h2);
    }
    popMatrix();
  }
}
public class Wave {
  ArrayList<Float> amps;
  ArrayList<Float> freqs;
  ArrayList<Float> phases;
  Wave() {
    amps = new ArrayList<Float>();
    freqs = new ArrayList<Float>();
    phases = new ArrayList<Float>();
    for (int i = 0; i < 5; i++) {
      amps.add(random(25));
      freqs.add(random(10));
      phases.add(random(TWO_PI));
    }
  }
  public float getValue(float t) {
    float value = 0;
    for (int i = 0; i < 5; i++) {
      value += amps.get(i)*sin(freqs.get(i)*t + phases.get(i));
    }
    return value;
  }
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_wave" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
