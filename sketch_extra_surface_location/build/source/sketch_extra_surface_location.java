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

public class sketch_extra_surface_location extends PApplet {

public void setup(){
  
  background(0,128,255);
}


public void draw(){
  int x = (-width+frameCount*10)%displayWidth-200;
  surface.setLocation(x,displayHeight/2-height/2-100);
}
  public void settings() {  size(200,200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_extra_surface_location" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
