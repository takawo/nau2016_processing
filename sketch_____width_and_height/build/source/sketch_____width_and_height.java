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

public class sketch_____width_and_height extends PApplet {


// width : \u30a6\u30a3\u30f3\u30c9\u30a6\u306e\u5e45\u3092\u683c\u7d0d\u3059\u308b\u30b7\u30b9\u30c6\u30e0\u5909\u6570
// height : \u30a6\u30a3\u30f3\u30c9\u30a6\u306e\u9ad8\u3055\u3092\u683c\u7d0d\u3059\u308b\u30b7\u30b9\u30c6\u30e0\u5909\u6570
// Processing\u5074\u3067\u7528\u610f\u3055\u308c\u3066\u3044\u308b\u306e\u3067\u7279\u306b\u4f55\u3082\u5ba3\u8a00\u3057\u306a\u304f\u3066\u3082\u547c\u3073\u51fa\u3057\u3066\u4f7f\u3048\u308b

// \u753b\u9762\u304c\u30d5\u30eb\u30b9\u30af\u30ea\u30fc\u30f3\u304b\u3069\u3046\u304b\uff1f
boolean isFullScreen = false;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {

  settings(); // settings : \u30d5\u30eb\u30b9\u30af\u30ea\u30fc\u30f3\u306e\u6307\u5b9a\u3092\u3059\u308b\u5834\u5408\u306f\u547c\u3073\u51fa\u3059\u5fc5\u8981\u304c\u3042\u308b

  // \u753b\u9762\u306e\u60c5\u5831\u3092\u30b3\u30f3\u30bd\u30fc\u30eb\u306b\u51fa\u529b
  println("\u30a6\u30a3\u30f3\u30c9\u30a6\u5e45(width) :" + width + "px");
  println("\u30a6\u30a3\u30f3\u30c9\u30a6\u5e45(height):" + height + "px");
  println("\u753b\u9762\u5e45(displayWidth) :" + displayWidth + "px");
  println("\u753b\u9762\u9ad8\u3055(displayHeight) :" + displayHeight + "px");

  // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092\u5909\u66f4\u53ef\u80fd\u306b\u3059\u308b
  surface.setResizable(true);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  // \u80cc\u666f\u8272\u3092\u6307\u5b9a(R,G,B)
  background(255, 255, 255); //RGB\u306f\u54040-255\u306e\u6570\u5024\u3067\u8272\u3092\u6307\u5b9a\u3059\u308b
  ellipse(width/2, height/2, 200, 200); //\u753b\u9762\u4e2d\u592e\u306b200px\u306e\u5186\u3092\u63cf\u753b
}

public void settings() {
  fullScreen(); // \u30d5\u30eb\u30b9\u30af\u30ea\u30fc\u30f3\u306b\u3059\u308b\u95a2\u6570
  isFullScreen = true;
}

// mousePressed\u95a2\u6570 : \u30de\u30a6\u30b9\u3092\u30af\u30ea\u30c3\u30af\u3057\u305f\u3068\u304d\u306b\u5b9f\u884c\u3055\u308c\u308b
public void mousePressed() {
  if (isFullScreen == false) {
    fullScreen();
  } else {
    int w = 960;
    int h = 540;
    int windowX = displayWidth/2 - w/2;
    int windowY = displayHeight/2 - h/2;
    surface.setLocation(windowX, windowY);
    surface.setSize(960, 540);
  }
  isFullScreen = !isFullScreen;
  println(isFullScreen);
}

public void changeWindowSize(int w, int h) {
  surface.setSize(w, h);
  size(w, h);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_____width_and_height" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
