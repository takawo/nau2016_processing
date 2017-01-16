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

public class sketch_xxx_typograpy_maze extends PApplet {

PGraphics graphic;
ArrayList<PVector> points = new ArrayList<PVector>();
int grid = 10;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
     // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
    colorMode(HSB, 360, 100, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
     // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b

    PFont font = createFont("YuGothic-Bold", 350);

    graphic = createGraphics(width, height);
    graphic.beginDraw();
    graphic.colorMode(HSB, 360, 100, 100, 100);
    graphic.background(0, 0, 100);
    graphic.textAlign(CENTER, CENTER);
    graphic.textFont(font, 350);
    graphic.fill(0, 0, 0);
    graphic.text("type", width/2, height/2);
    graphic.endDraw();

    for (int y = 0; y < height; y += grid) {
        for (int x = 0; x < width; x += grid) {
            if (brightness(graphic.get(x, y)) < 1) {
                fill(0, 0, 0);
                noStroke();
                ellipse(x, y, grid, grid);
                points.add(new PVector(x, y));
            }
        }
    }
}


// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
    background(0, 0, 100);
    for (PVector p : points) {
        if(random(1) < 0.5f){
            strokeWeight(grid/2);
            stroke(120,80,100,50);
            line(p.x,p.y,p.x+grid,p.y+grid);
        }else{
            strokeWeight(grid/4);
            stroke(0,80,100,50);
            line(p.x,p.y+grid,p.x+grid,p.y);
        }
    }
    noLoop();
}

public void mousePressed(){
    redraw();
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_typograpy_maze" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
