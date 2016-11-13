import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_028_video3 extends PApplet {



Capture cam;

public void setup() {
  
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  cam = new Capture(this, 1280, 720);
  cam.start();
}

public void draw() {
  if (cam.available()) {
    background(0, 0, 0);
    cam.read();
    cam.loadPixels();
    for ( int y = 0; y < cam.height; y+=20 ) {
      beginShape();
      for ( int x = 0; x < cam.width; x++ ) {
        int c = cam.get(x, y);
        float brightness = brightness(c);
        float n = noise(x/70f, y/60f, (brightness+frameCount*5)/50f);
        n = map(n, 0, 1, 1, -1);
        stroke(0, 0, 100);
        strokeWeight(2);
        noFill();
        if(brightness > 50){
          vertex(x, y+n*20);
        }else{
          vertex(x,y);
        }
        //vertex(x, y+(red(c)+green(c)+blue(c))/25);
      }
      endShape();
    }
  }
}
  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_028_video3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
