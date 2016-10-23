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

public class sketch_extra_coding_template extends PApplet {

// \u5909\u6570


// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100, 100);

}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  stroke(0,0,0);
  line(pmouseX,pmouseY,mouseX,mouseY);

  noStroke();
  fill(frameCount*0.1f,80,100);
  ellipse(mouseX,mouseY,10,10);

}

/*
**  \u30de\u30a6\u30b9\u30a4\u30d9\u30f3\u30c8\uff08\u30af\u30ea\u30c3\u30af\u30fb\u30c9\u30e9\u30c3\u30b0\uff09\u95a2\u6570
*/

// mousePressed\u95a2\u6570 : \u30af\u30ea\u30c3\u30af\u3057\u305f\u6642
public void mousePressed() {

}

// mouseReleased\u95a2\u6570 : \u30af\u30ea\u30c3\u30af\u3092\u96e2\u3057\u305f\u6642
public void mouseReleased() {

}
// mouseDragged\u95a2\u6570\uff1a\u30de\u30a6\u30b9\u3092\u30c9\u30e9\u30c3\u30b0\u3057\u305f\u3068\u304d
public void mouseDragged() {

}

// mouseMoved\u95a2\u6570\uff1a\u30de\u30a6\u30b9\u3092\u52d5\u304b\u3057\u305f\u3068\u304d
public void mouseMoved() {

}

// keyPressed\u95a2\u6570\uff1a\u30ad\u30fc\u30dc\u30fc\u30c9\u306e\u30ad\u30fc\u3092\u30bf\u30a4\u30d7\u3057\u305f\u6642
public void keyPressed(){

}

// keyPressed\u95a2\u6570\uff1a\u30ad\u30fc\u30dc\u30fc\u30c9\u306e\u30ad\u30fc\u3092\u62bc\u3057\u3066\u96e2\u3057\u305f\u6642
public void keyReleased(){

}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_extra_coding_template" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
