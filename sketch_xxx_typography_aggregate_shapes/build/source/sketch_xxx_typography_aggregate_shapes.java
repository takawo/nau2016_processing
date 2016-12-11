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

public class sketch_xxx_typography_aggregate_shapes extends PApplet {

PGraphics pg;
int mode = 0;
int drawSpeed = 200;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB,360,100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b

  pg = createGraphics(width,height);
  pg.beginDraw();
  pg.textSize(350);
  pg.textAlign(CENTER,CENTER);
  pg.colorMode(HSB,360,100,100,100);
  pg.fill(0,0,0);
  pg.noStroke();
  pg.text("TYPE",pg.width/2,pg.height/2);
  pg.endDraw();

  background(0,0,100);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  for(int i = 0; i < drawSpeed; i++){
    int x = (int) random(pg.width);
    int y = (int) random(pg.height);
    int c = pg.get(x,y);
    if(c == color(0,0,0)){
      drawObject(x,y,mode);
    }
  }
}

public void drawObject(int x ,int y, int mode){
  pushMatrix();
  translate(x, y);
  switch (mode) {
  case 0:
    float er = random(3, 15);
    int ec = color(random(0,120), 100, 100);
    noStroke();
    fill(ec);
    ellipse(0, 0, er, er);
    break;
  case 1:
    float td = random(3, 7.5f);
    float tr = random(TWO_PI);
    int tc = color(random(120, 240), 100, random(50, 100));
    noStroke();
    fill(tc);
    rotate(tr);
    triangle(0, -td, -td, td, td, td);
    break;
  case 2:
    float rw = random(5, 7.5f);
    float rh = random(5, 15);
    float rr = random(TWO_PI);
    int rc = color(random(240,360), random(70, 100), random(20, 100));
    noStroke();
    fill(rc);
    rotate(rr);
    rect(0, 0, rw, rh);
    break;
  }
  popMatrix();
}

public void mousePressed(){
  background(0,0,100);
  mode = (mode + 1)%3;
}
  public void settings() {  size(960,540);  smooth(16); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_typography_aggregate_shapes" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
