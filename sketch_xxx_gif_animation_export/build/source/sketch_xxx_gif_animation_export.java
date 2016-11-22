import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import gifAnimation.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_xxx_gif_animation_export extends PApplet {

// GIF\u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u518d\u751f\u306e\u305f\u3081\u306e\u30e9\u30a4\u30d6\u30e9\u30ea\u300cgifAnimation\u300d\u306e\u8aad\u307f\u8fbc\u307f


// \u5909\u6570
GifMaker gifExport; // GIF\u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u51fa\u529b\u7528\u30a4\u30f3\u30b9\u30bf\u30f3\u30b9
int fps = 30; // \u30d5\u30ec\u30fc\u30e0\u30ec\u30fc\u30c8
int duration = 3; // GIF\u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u306e\u8a18\u9332\u79d2\u6570

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(fps);
  gifExport = new GifMaker(this, "./data/"+getClass().getSimpleName() +".gif"); // \u30d5\u30a1\u30a4\u30eb\u540d\u306eGIF\u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u3092\u4f5c\u6210
  gifExport.setRepeat(0); // \u30a8\u30f3\u30c9\u30ec\u30b9\u518d\u751f
  gifExport.setQuality(10); // \u30af\u30aa\u30ea\u30c6\u30a3(\u30c7\u30d5\u30a9\u30eb\u30c810)
  gifExport.setDelay(1000/fps); // \u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u306e\u9593\u9694\u309230ms(33fps)\u306b
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 100);
  noStroke();
  fill(220, 80, 100);
  float t = map(noise(width/2, frameCount*0.03f), 0, 1, -1, 1);
  float s = map(noise(height/2, frameCount*0.03f), 0, 1, -1, 1);
  float x = width/2 + t*250;
  float y = height/2 + s*250;
  ellipse(x, y, 100, 100);
  gifExport.addFrame();

  //GIF\u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u306e\u4fdd\u5b58
  if (frameCount <= fps*duration) {
    gifExport.addFrame(); // \u30d5\u30ec\u30fc\u30e0\u3092\u8ffd\u52a0
  } else {
    gifExport.finish(); // \u7d42\u4e86\u3057\u3066\u30d5\u30a1\u30a4\u30eb\u4fdd\u5b58
  }
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
public void keyPressed() {
  if (key == 's' || key == 'S') {
    gifExport.finish();
    println("gif saved.");
  }
}

// keyPressed\u95a2\u6570\uff1a\u30ad\u30fc\u30dc\u30fc\u30c9\u306e\u30ad\u30fc\u3092\u62bc\u3057\u3066\u96e2\u3057\u305f\u6642
public void keyReleased() {
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_gif_animation_export" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
