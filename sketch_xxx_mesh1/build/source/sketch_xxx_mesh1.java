import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import megamu.mesh.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_xxx_mesh1 extends PApplet {



int num = 20;
float[][] points = new float[num][2];
float[][] speed = new float[num][2];

Delaunay myDelaunay;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  for (int i = 0; i < points.length; i++) {
    points[i][0] = random(width);
    points[i][1] = random(height);
    float theta = random(TWO_PI);
    speed[i][0] = sin(theta);
    speed[i][1] = cos(theta);
  }
  myDelaunay = new Delaunay( points );
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 100);
  for (int i = 0; i < points.length; i++) {
    points[i][0] += speed[i][0];
    points[i][1] += speed[i][1];
    strokeWeight(15);
    point(points[i][0], points[i][1]);

    if(points[i][0] < 0 || points[i][0] > width){
      speed[i][0] *= -1;
    }
    if(points[i][1] < 0 || points[i][1] > height){
      speed[i][1] *= -1;
    }

  }
  myDelaunay = new Delaunay( points );
  //float[][] myEdges = myDelaunay.getEdges();

  //for (int i=0; i<myEdges.length; i++)
  //{
  //  float startX = myEdges[i][0];
  //  float startY = myEdges[i][1];
  //  float endX = myEdges[i][2];
  //  float endY = myEdges[i][3];
  //  strokeWeight(1);
  //  line( startX, startY, endX, endY );
  //}
  int[][] myLinks = myDelaunay.getLinks();

  for (int i=0; i<myLinks.length; i++)
  {
    int startIndex = myLinks[i][0];
    int endIndex = myLinks[i][1];

    float startX = points[startIndex][0];
    float startY = points[startIndex][1];
    float endX = points[endIndex][0];
    float endY = points[endIndex][1];
    strokeWeight(3);
    line( startX, startY, endX, endY );
  }
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_mesh1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
