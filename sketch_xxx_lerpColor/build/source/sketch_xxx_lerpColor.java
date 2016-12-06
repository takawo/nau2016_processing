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

public class sketch_xxx_lerpColor extends PApplet {
  public void setup() {

 // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
colorMode(HSB,360,100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
 // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
noStroke(); // \u7dda\u306e\u8272\u3092\u30ca\u30b7\u306b

int c1 = color(70,80,100); // \u8d77\u70b9\u306e\u8272C1
int c2 = color(180,80,100);// \u7d42\u70b9\u306e\u8272C2

for(float x = 0; x < width; x += 1){
  //lerpColor : \u8d77\u70b9\u306e\u8272\u3001\u7d42\u70b9\u306e\u8272\u3001\u5272\u5408(0.0-1.0)\u3067\u8272\u3092\u751f\u6210\u3059\u308b
  int c = lerpColor(c1,c2,x/width);
  fill(c);
  rect(x,0,5,height);
}
    noLoop();
  }

  public void settings() { 
size(960,540); 
smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_lerpColor" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
