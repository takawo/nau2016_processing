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

public class sketch_003_size extends PApplet {
  public void setup() {
// \u30a6\u30a3\u30f3\u30c9\u30a6\u306e\u30b5\u30a4\u30ba\u3092\u5909\u66f4\u3059\u308b\u547d\u4ee4
// \u5e45\u3068\u9ad8\u3055\u3092\u6307\u5b9a\u3059\u308b
 // \u5e45960px\u3001\u9ad8\u3055540px\u3092\u6307\u5b9a

// 1. \u5e45\u3068\u9ad8\u3055\u3092\u3044\u308c\u304b\u3048\u3066\u307f\u308b
// 2. \u5e45\u3068\u9ad8\u3055\u3092\u597d\u304d\u306a\u6570\u5024\u306b\u3057\u3066\u307f\u308b
    noLoop();
  }

  public void settings() { 
size(960,540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_003_size" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
