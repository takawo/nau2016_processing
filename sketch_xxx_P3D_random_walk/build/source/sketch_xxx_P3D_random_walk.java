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

public class sketch_xxx_P3D_random_walk extends PApplet {

ArrayList<Mover> movers = new ArrayList<Mover>();
Mover m;
public void setup() {
  
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 0);
  sphereDetail(1);
  for (int i = 0; i < 30; i++) {
    m = new Mover();
    movers.add(m);
  }
}

public void draw() {
  blendMode(ADD);
  hint(DISABLE_DEPTH_TEST);
  //fill(0, 0, 0, 10);
  //noStroke();
  //rect(0, 0, width, height);
  background(0,0,0);
  hint(ENABLE_DEPTH_SORT);
  fill(0, 0, 100);
  lights();
  pushMatrix();
  translate(width/2, height/2, -1000);
  rotateY(frameCount*0.01f);
  rotateZ(sin(frameCount*0.01f)*PI/4);
  //rotateZ(frameCount*0.002);
  for (Mover m : movers) {
    m.update();
    m.draw();
  }
  popMatrix();
}
class Mover extends PVector {
  ArrayList<PVector> points = new ArrayList<PVector>();
  float life;
  PVector target;
  float grid = 10;
  int fillc = color(random(360), 80, 100);
  int strokec = color(hue(fillc), 40, 100);
  float easing = 1;
  public Mover() {
    life = random(1000, 1500);
    points.add(new PVector(0, 0, 0));
    setTarget();
  }
  public void setTarget() {
    int x_random = (int)random(3);
    int y_random = (int)random(3);
    int z_random = (int)random(3);
    target = new PVector();

    if (x_random == 0) {
      target.x =x + 0;
    } else if (x_random == 1) {
      target.x =x + grid;
    } else if (x_random == 2) {
      target.x =x - grid;
    }
    if (y_random == 0) {
      target.y =y + 0;
    } else if (y_random == 1) {
      target.y =y + grid;
    } else if (y_random == 2) {
      target.y =y - grid;
    }
    if (z_random == 0) {
      target.z =z + 0;
    } else if (z_random == 1) {
      target.z =z + grid;
    } else if (z_random == 2) {
      target.z =z - grid;
    }
  }
  public void update() {
    life -= 1;
    x += (target.x - x)*easing;
    y += (target.y - y)*easing;
    z += (target.z - z)*easing;
    if (dist(this, target) < 0.5f) {
      x = target.x;
      y = target.y;
      z = target.z;
      points.add(target);
      setTarget();
    }
  }
  public void draw() {
    //if (life > 0) {
    //  pushMatrix();
    //  translate(x, y, z);
    //  noStroke();
    //  fill(fillc);
    //  sphere(20);
    //  popMatrix();
    //}
    strokeWeight(1);
    stroke(strokec);
    noFill();
    pushMatrix();
    if (points.size() == 0) {
      line(0, 0, 0, x, y, z);
    }
    for (int i = 0; i <this.points.size()-1; i++) {
      PVector p1 =points.get(i);
      PVector p2 =points.get(i+1);
      line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
    }
    PVector lastP =points.get(points.size()-1);
    line(x, y, z, lastP.x, lastP.y, lastP.z);
    popMatrix();
  }
}
  public void settings() {  size(960, 540, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_P3D_random_walk" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
