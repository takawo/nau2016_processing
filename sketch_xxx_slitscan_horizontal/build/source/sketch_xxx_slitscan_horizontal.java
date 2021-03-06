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

public class sketch_xxx_slitscan_horizontal extends PApplet {



// Video
Capture cam;

// number of frames
final int frameNum = 180;
// current frame
int currentFrame = 0;
// Image Array
PImage[] images = new PImage[frameNum];
PImage[] slit_images = new PImage[frameNum];

boolean isLineShow = false;
int slitHeight;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  frameRate(30);
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  cam = new Capture(this, 1280, 720);
  cam.start();
  for (int i = 0; i < frameNum; i++) {
    images[i] = new PImage();
  }
  slitHeight = height / frameNum;
}
public void captureEvent(Capture cam){
  cam.read();
}
// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0,0,0);
  images[currentFrame] = cam.get();
  int tmpFrame = 0;

  for (int i=0; i<frameNum; i++) {
    tmpFrame = currentFrame + i + 1;
    if (tmpFrame > frameNum-1) {
      tmpFrame = tmpFrame - frameNum;
    }
    slit_images[i] = images[tmpFrame].get(0, i*slitHeight, width, slitHeight);
  }

  for (int i=0; i<frameNum; i++) {
    image(slit_images[i], 0, i*slitHeight, width, slitHeight);
  }

  currentFrame++;
  if (currentFrame > frameNum-1) {
    currentFrame = 0;
  }
  if(isLineShow){
    stroke(0,0,100);
    strokeWeight(5);
    line(0,(frameNum-currentFrame)*slitHeight,width,(frameNum-currentFrame)*slitHeight);
  }
}

public void keyPressed(){
  if(key == ' '){
    isLineShow = !isLineShow;
  }
}
  public void settings() {  size(1280, 720);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_slitscan_horizontal" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
