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

public class sketch_xxx_random2 extends PApplet {

// \u5909\u6570
int col = 20; // \u5217\u306e\u6570
int[] nums = new int[col]; // \u5217\u306e\u6570\u5206\u306e\u914d\u5217
int colWidth;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100);
  colWidth = width/col; // \u30d0\u30fc\u306e\u5e45 = \u753b\u9762\u5e45/\u5217\u6570
  // \u914d\u5217\u306e\u500b\u6570\u5206for\u30eb\u30fc\u30d7
  for (int i = 0; i < nums.length; i++) {
    nums[i] = 0; //\u914d\u5217\u306e\u5404\u8981\u7d20\u306e\u521d\u671f\u5316
  }
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 95);
  // \u30e9\u30f3\u30c0\u30e0\u3067\u9078\u3093\u3060\u6570\u5024\u306e\u914d\u5217\u306e\u5024\u3092\u52a0\u7b97
  //\u5217\u306e\u6570(0\u301c20)\u3067\u3001\u30e9\u30f3\u30c0\u30e0\u306b\u6570\u5b57\u3092\u9078\u3076(\u6570\u5b57\u304c\u5c0f\u3055\u3044\u65b9\u306b\u504f\u308a\u3042\u308a)
  int r = PApplet.parseInt(random(1)*random(1)*col);

  // \u5927\u304d\u3044\u6570\u5b57\u304c\u51fa\u73fe\u3057\u3084\u3059\u3044\u3088\u3046\u306b\u3059\u308b\u306b\u306f
  // int r = int((1 - random(1)*random(1))*col);

  nums[r] += 5; //\u8a72\u5f53\u5217\u306b\u3042\u305f\u308b\u914d\u5217\u306e\u6570\u50245\u3092+\u3059\u308b\u3002

  // \u5404\u5217\u306e\u77e9\u5f62\u3092\u63cf\u753b
  for (int i = 0; i < nums.length; i++) {
    float x = i*colWidth; // \u958b\u59cb\u70b9\u306ex\u5ea7\u6a19
    float y = height-nums[i]; // \u958b\u59cb\u70b9\u306ey\u5ea7\u6a19
    float w = colWidth; //\u5217\u306e\u5e45
    float h = nums[i]; // \u5217\u306e\u9ad8\u3055=\u914d\u5217\u306e\u5024

    // \u5217\u306e\u9ad8\u3055\u306b\u5fdc\u3058\u3066\u3001\u77e9\u5f62\u306e\u5857\u308a\u3064\u3076\u3057\u8272\u306e\u5f69\u5ea6\u3092\u5897\u6e1b
    fill(0, map(h, 0, height, 0, 100), 100);
    rect(x, y, w, h); //\u914d\u5217\u306e\u500b\u6570\u5206\u3001\u56db\u89d2\u3092\u63cf\u753b
  }
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_random2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
