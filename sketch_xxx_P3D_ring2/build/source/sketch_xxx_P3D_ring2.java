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

public class sketch_xxx_P3D_ring2 extends PApplet {

ArrayList<Point> points = new ArrayList<Point>();
int num = 1500;
float minR = 300;
float maxR = 600;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  for (int i = 0; i < num; i++) {
    float theta = random(TWO_PI);
    float r = random(minR, maxR);
    points.add(new Point(theta, r));
  }
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 0);
  lights();
  ambientLight(0,0,30);
  stroke(220, 80, 100, 65);
  strokeWeight(2.0f);
  translate(width/2, height/2, -(minR+maxR)/1.5f);
  rotateX(frameCount*0.003f);
  rotateY(frameCount*0.004f);
  rotateZ(frameCount*0.001f);
  for (Point p : points) {
    p.update();
    for (Point q : points) {
      if (!p.pos.equals(q.pos)) {
        float dist = p.pos.dist(q.pos);
        if (dist < 70) {
          strokeWeight(map(dist,0,70,10,1.0f));
          line(p.pos.x, p.pos.y, p.pos.z, q.pos.x, q.pos.y, q.pos.z);
        }
      }
    }
  }
}
class Point extends PVector {
  float theta;
  float incTheta;
  float r;
  PVector pos;
  Point(float _theta, float _r) {
    theta = _theta;
    r = _r;
    float n = (random(1) + random(1) + random(1) +random(1) + random(1)) / 5f;
    float x = cos(theta) * r;
    float y = sin(theta) * r;
    float z = map(n, 0, 1, -r/1.5f, r/1.5f);
    pos = new PVector(x, y, z);
    incTheta = random(-0.001f,0.001f);
  }
  public void update() {
    theta += incTheta;
    pos.x = cos(theta) * r;
    pos.y = sin(theta) * r;
  }
}
  public void settings() {  size(960, 540, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_P3D_ring2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
