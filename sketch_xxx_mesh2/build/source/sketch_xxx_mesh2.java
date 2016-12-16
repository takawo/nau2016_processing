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

public class sketch_xxx_mesh2 extends PApplet {



public void setup() {
  
  colorMode(HSB, 360, 100, 100);
}

public void draw() {
  float[][] points = new float[3][2];

  points[0][0] = random(width); // first point, x
  points[0][1] = random(height); // first point, y
  points[1][0] = random(width); // second point, x
  points[1][1] = random(height); // second point, y
  points[2][0] = random(width); // third point, x
  points[2][1] = random(height); // third point, y

  Voronoi myVoronoi = new Voronoi( points );

  MPolygon[] myRegions = myVoronoi.getRegions();

  for (int i=0; i<myRegions.length; i++){
    // an array of points
    float[][] regionCoordinates = myRegions[i].getCoords();

    fill(random(360), 80, 100);
    strokeWeight(3);
    myRegions[i].draw(this); // draw this shape
  }
  for(int i = 0; i < points.length; i++){
    float x = points[i][0];
    float y = points[i][1];
    stroke(0,0,0);
    strokeWeight(15);
    point(x,y);
  }
  noLoop();
}

public void mousePressed(){
  redraw();
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_mesh2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
