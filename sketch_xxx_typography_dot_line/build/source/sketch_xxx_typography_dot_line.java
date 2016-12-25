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

public class sketch_xxx_typography_dot_line extends PApplet {

int BACKGROUND_COLOR;
int FILL_COLOR;

PGraphics pg;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB,360,100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b

  BACKGROUND_COLOR = color(0,0,100);
  FILL_COLOR = color(0,0,0);

  PFont font = createFont("Yu-Gothic",300);

  pg = createGraphics(width,height);
  pg.beginDraw();
  pg.colorMode(HSB,360,100,100);
  pg.background(BACKGROUND_COLOR);
  pg.fill(FILL_COLOR);
  pg.textFont(font);
  pg.textSize(300);
  pg.textAlign(CENTER,CENTER);
  pg.text("\u81ea\u5b85",width/2,height/2);
  pg.endDraw();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  background(BACKGROUND_COLOR);
  float nX = noise((width/2+frameCount)*0.09f,frameCount*0.001f);
  float nY = noise((height/2+frameCount)*0.08f,frameCount*0.005f);
  int gridX = (int)map(nX,0,.5f,1,20);
  int gridY = (int)map(nY,0,.5f,1,20);

  // int gridX = (int)map(mouseX,0,width,3,50);
  // int gridY = (int)map(mouseY,0,height,3,50);

  int margin = max(gridX,gridY) * 2;
  for(int y = -margin; y < height+margin; y+=gridY){
    for(int x = -margin; x < width+margin; x+=gridX){
      boolean inText = (pg.get(x,y)==FILL_COLOR);
      if(inText){
        fill(FILL_COLOR);
        noStroke();
        ellipse(x,y,gridX,gridX);
      }else{
        stroke(FILL_COLOR);
        line(x,y,x+gridX,y+gridX);
        line(x+gridX/2,y,x+gridX+gridX/2,y+gridX);
      }
    }
  }
}
  public void settings() {  size(960,540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_typography_dot_line" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
