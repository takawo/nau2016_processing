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

public class sketch_xxx_easing extends PApplet {

float x,y,w,h,angle;
float tx,ty,tw,th,tangle;
int c;
int tc;
float easing;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100, 100); // HSB\u306e\u8272\u7a7a\u9593\u3092\u4f7f\u7528
  rectMode(CENTER); //\u77e9\u5f62\u306e\u63cf\u753b\u306exy\u3092\u4e2d\u5fc3\u306b\u5909\u66f4\uff08\u30c7\u30d5\u30a9\u30eb\u30c8\u306f\u5de6\u4e0a\uff09
  background(0, 0, 100); // \u80cc\u666f\u3092\u767d\u306b
  initEasing();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  // \u30e2\u30fc\u30b7\u30e7\u30f3\u30d6\u30e9\u30fc
  fill(0, 0, 100, 1); // \u900f\u660e\u5ea6\u3092\u4e0b\u3052\u305f\u767d\u3067
  rect(width/2, height/2, width, height); //\u753b\u9762\u30b5\u30a4\u30ba\u306e\u77e9\u5f62\u3092\u63cf\u753b
  // rectMode\u304c\u30c7\u30d5\u30a9\u30eb\u30c8\u306e\u5834\u5408\u306f\u3001rect(0,0,width,height);
  // \u4e0a\u306e2\u884c\u3067\u30e2\u30fc\u30b7\u30e7\u30f3\u30d6\u30e9\u30fc\u304c\u304b\u3051\u3089\u308c\u308b

  noStroke(); // \u7dda\u306e\u8272\u3092\u30ca\u30b7\u306b
  fill(c); // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u3092c\u306b

  // \u30a4\u30fc\u30b8\u30f3\u30b0\u306e\u95a2\u6570lerp(a,b,a\u3068b\u306e\u9593\u306e\u5272\u54080.0\u301c1.0\u307e\u3067)
  // lerp\u306e\u5024\u3092x,y\u306a\u3069\u306b\u4ee3\u5165\u3059\u308b\u3053\u3068\u3067\u3001\u5c11\u3057\u305a\u3064\u52d5\u304f\u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u3092\u5b9f\u73fe\u3057\u3066\u3044\u308b
  // x,y,size,c,angle\u306a\u3069\u69d8\u3005\u306a\u8981\u7d20\u306b\u30a4\u30fc\u30b8\u30f3\u30b0\u3092\u304b\u3051\u308b\u65b9\u6cd5
  x = lerp(x, tx, easing);
  y = lerp(y, ty, easing);
  w = lerp(w, tw, easing);
  h = lerp(h, th, easing);
  c = lerpColor(c, tc, easing); //\u8272\u3082lerpColor\u3068\u3044\u3046\u95a2\u6570\u3067\u30a4\u30fc\u30b8\u30f3\u30b0\u51fa\u6765\u308b
  angle = lerp(angle, tangle, easing); // \u89d2\u5ea6\u3082\u30a4\u30fc\u30b8\u30f3\u30b0

  pushMatrix(); // \u5ea7\u6a19\u3092\u4fdd\u5b58
  translate(x, y); // \u539f\u70b9\u5ea7\u6a19\u3092\u79fb\u52d5
  rotate(radians(angle));  // \u56de\u8ee2
  rect(0, 0, w, h);  // \u77e9\u5f62\u3092\u63cf\u753b
  popMatrix();  // \u5ea7\u6a19\u3092\u623b\u3059

  // \u3082\u3057\u30bf\u30fc\u30b2\u30c3\u30c8\u306e\u4f4d\u7f6e\u306b\u8fd1\u3065\u3044\u305f\u3089
  // dist\u95a2\u6570\u30672\u70b9\u9593\u306e\u8ddd\u96e2\u3092\u8a08\u7b97\u3067\u304d\u308b
  if (dist(x, y, tx, ty) < 1) {
    // \u3064\u304e\u306e\u30bf\u30fc\u30b2\u30c3\u30c8\u3092\u8a2d\u5b9a
    findTarget();
  }
}

// \u521d\u671f\u5316
public void initEasing() {
  // \u521d\u671f\u5024\u3092\u30e9\u30f3\u30c0\u30e0\u306b\u8a2d\u5b9a
  x = random(width);
  y = random(height);
  tx = random(width);
  ty = random(height);
  w = random(200);
  tw = random(200);
  h = random(200);
  th = random(200);
  angle = random(TWO_PI);
  tangle = random(TWO_PI);

  easing = random(0.01f, 0.08f);

  float n = random(360); // \u8272\u76f8\u3092\u30e9\u30f3\u30c0\u30e0\u306b
  c = color(n, 80, 100);
  tc = color((n+180)%360, 80, 100); // \u53cd\u5bfe\u306e\u8272\u3092\u8a2d\u5b9a
}

// \u30bf\u30fc\u30b2\u30c3\u30c8\u306b\u8fd1\u3065\u3044\u305f\u3068\u304d\u306e\u51e6\u7406
// \u6b21\u306e\u30bf\u30fc\u30b2\u30c3\u30c8\u3092\u8a2d\u5b9a\u3059\u308b
public void findTarget() {
  x = tx; //\u8fd1\u3065\u3044\u3066\u3044\u308b\u306e\u3067\u3001x,y\u305d\u308c\u305e\u308c\u30bf\u30fc\u30b2\u30c3\u30c8\u306e\u4f4d\u7f6e\u306b\u79fb\u52d5\u3055\u305b\u308b
  y = ty;
  // tx,ty\u306e\u5024\u3092\u30e9\u30f3\u30c0\u30e0\u306b\uff08\u3042\u308b\u7a0b\u5ea6\u96e2\u308c\u3066\u3044\u308b\u3088\u3046\u306b\u3059\u308b\u305f\u3081\u306bdo-while\u6587\u3092\u4f7f\u3046\uff09
  do {
    tx = random(width);
    ty = random(height);
  } while (dist(x, y, tx, ty) < 300);

  w = tw;
  tw = random(200);
  h = th;
  th = random(200);

  easing = random(0.01f, 0.08f);

  c = tc;
  float n = random(360);
  tc = color(n, 80, 100);

  angle = tangle%360;
  tangle = random(360);
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_easing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
