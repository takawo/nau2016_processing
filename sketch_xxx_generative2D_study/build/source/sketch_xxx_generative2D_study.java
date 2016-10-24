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

public class sketch_xxx_generative2D_study extends PApplet {

float n;
public void setup() {
  
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  n = PApplet.parseInt(random(3,10));
}

public void draw() {
  background(0, 0, 100);
  for (float r = 100; r < 500; r += 10) {
    beginShape();
    for (float angle = 0; angle < 360; angle += 1) {
      float theta = radians(angle);
      pushMatrix();
      translate(width/2, height/2);
      rotate(theta+frameCount*0.001f);
      float t = map(sin(theta*n-frameCount*0.035f)*cos(frameCount*0.05f), -1f, 1f, 0, 1f);
      float len = noise(t, frameCount*0.03f)*r;
      PVector p = localToScreen(len, 0);
      vertex(p.x, p.y);
      popMatrix();
    }
    endShape(CLOSE);
  }
  if(random(1) < 0.01f){
      n = PApplet.parseInt(random(3,10));
  }
}

public PVector screenToLocal(float x, float y) {
  PVector in = new PVector(x, y);
  PVector out = new PVector();
  PMatrix2D current_matrix = new PMatrix2D();
  getMatrix(current_matrix);
  current_matrix.invert();
  current_matrix.mult(in, out);
  return out;
}

public PVector localToScreen(float x, float y) {
  PVector in = new PVector(x, y);
  PVector out = new PVector();
  PMatrix2D current_matrix = new PMatrix2D();
  getMatrix(current_matrix);
  current_matrix.mult(in, out);
  return out;
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_generative2D_study" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
