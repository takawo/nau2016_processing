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

public class sketch_xxx_typography_wave extends PApplet {

PGraphics pg;

int gridX = 5;
int gridY = 10;
float waveHeight = 30;
float baseHeight = 5;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB,360,100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  pg = createGraphics(width,height);
  pg.beginDraw();
  PFont f = createFont("Courier", 400);
  pg.textFont(f);
  pg.textAlign(CENTER,CENTER);
  pg.colorMode(HSB,360,100,100,100);
  pg.fill(0,0,0);
  pg.text("TYPE",pg.width/2,pg.height/2);
  pg.endDraw();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  background(0,0,100);
  float fc = frameCount * 0.01f;
  for(int y = 0; y < pg.height; y += gridY){
    boolean continuous = false;
    for(int x = 0; x < pg.width; x += gridX){
      float vy = (float)y;
      float vx = (float)x;
      int c = pg.get(x,y);
      boolean inText;
      if(c == color(0,0,0)){
        inText = true;
      }else{
        inText = false;
      }
      if(inText){
        if(!continuous){
          continuous = true;
          fill((vy*width + vx + frameCount)%360,80,100);
          noStroke();
          beginShape();
          vertex(vx,vy);
        }
        float n = noise(vx+fc,vy,fc);
        vy -= n * n * waveHeight + baseHeight;
        curveVertex(vx,vy);
      }else{
        if(continuous){
          continuous = false;
          vertex(vx,vy);
          endShape(CLOSE);
        }
      }




    }
  }
}
  public void settings() {  size(960,540,P2D);  smooth(16); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_typography_wave" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
