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

public class sketch_xxx_concentric_circle3 extends PApplet {

ArrayList<Point> points = new ArrayList<Point>();
float rMin = 50;
float rMax = 550;
float rStep = 15;
float angleStep = 45;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  int counter  = 0;
  for (float r = rMin; r < rMax; r += rStep) {
    for (float angle = 0; angle < 360; angle += angleStep) {
      float theta = radians(angle);
      float x1 = 0;
      float y1 = 0;
      if(counter%2 == 0){
        x1 = cos(theta) * r;
        y1 = sin(theta) * r;

      }else{
        x1 = cos(theta-radians(angleStep/2)) * r;
        y1 = sin(theta-radians(angleStep/2)) * r;
      }
      float z1 = map(dist(x1,y1,0,0),0,sqrt(sq(width/2)+sq(height/2)),-250,250);
      points.add(new Point(x1, y1, z1));
    }
    counter++;
  }
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 0);
  translate(width/2, height/2, 0);
  rotateY(frameCount*0.005f);
  rotateZ(frameCount*0.01f);
  for (Point p : points) {
    p.display();
    for (Point q : points) {
      if (p.equals(q) == false) {
        float dist = p.calDist(q);
        if (dist < 200) {
          stroke(0, 0, 100, 100);
          strokeWeight(1);
          line(p.x, p.y,p.z, q.x, q.y,q.z);
        }
      }
    }
  }
}

class Point {
  float x;
  float y;
  float z;
  Point(float _x, float _y,float _z) {
    x = _x;
    y = _y;
    z = _z;
  }
  public void display() {
    stroke(0, 0, 100, 100);
    strokeWeight(5);
    pushMatrix();
    translate(x,y,z);
    point(0,0);
    popMatrix();
  }
  public float calDist(Point q) {
    return dist(x, y, z, q.x, q.y, q.z);
  }
}
  public void settings() {  size(960, 540, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_concentric_circle3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
