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

public class sketch_xxx_mesh3_voronoi_image extends PApplet {



int num = 1000;
float[][] points = new float[num][2];
PImage img;
Voronoi myVoronoi;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  textAlign(CENTER, CENTER);
  textSize(8);
  img = loadImage("http://radical-everyday.com/wp-content/uploads/2016/02/yume.jpg");
  for (int i =0; i < num; i++) {
    points[i][0] = 0 + random(0.01f);
    points[i][1] = 0 + random(0.01f);
  }
  pointsInit();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  if (mousePressed) {
    return;
  }
  image(img, 0, 0);
  MPolygon[] myRegions = myVoronoi.getRegions();
  for (int i=0; i<myRegions.length; i++) {
    float x = points[i][0] + +random(0.01f);
    float y = points[i][1] + +random(0.01f);
    int c = img.get((int)x, (int)y);
    // an array of points
    float[][] regionCoordinates = myRegions[i].getCoords();
    fill(c,100);
    noStroke();
    // stroke(0, 0, 50);
    myRegions[i].draw(this); // draw this shape
    //fill(0, 0, 0);
    //ellipse(x,y,20,20);
    //fill(0, 0, 100);
    //text(i, x, y);
  }
  noLoop();
}

public void pointsInit() {
  int i = 0;
  while (i < num) {
    float x = random(width);
    float y = random(height);
    int c = img.get((int)x, (int)y);
    if (red(c) > 50 || blue(c) > 50 || green(c) > 50) {
      points[i][0] = x + random(0.01f);
      points[i][1] = y + random(0.01f);
      i++;
    }
  }
  if (i == num) {
    myVoronoi= new Voronoi(points);
  }
  delay(1000);
  background(0, 0, 100);
}

public void mousePressed() {
  pointsInit();
  redraw();
}
  public void settings() {  size(650, 715);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_mesh3_voronoi_image" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
