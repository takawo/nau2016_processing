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

public class sketch_xxx_array_ball_gravity extends PApplet {

// \u5909\u6570
int num = 100;
Ball[] balls = new Ball[num];
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100, 100); // \u8272\u7a7a\u9593\u3092HSB\u306b
  background(0, 0, 0); // \u80cc\u666f\u3092\u767d\u306b

  for(int i = 0; i < num; i++){
    balls[i] = new Ball(width/2,height/2);
  }
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  //background(0,0,100);
  // 2.\u30d5\u30ec\u30fc\u30e0\u3054\u3068\u306b\u900f\u660e\u5ea6\u306e\u4f4e\u3044\u56db\u89d2\u3092\u63cf\u753b\u3059\u308b\u3053\u3068\u3067\u3001\u30dc\u30fc\u30eb\u306e\u8ecc\u8de1\u304c\u63cf\u753b\u3055\u308c\u308b
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);

  for (int i = 0; i < num; i++) {
    balls[i].update();
    balls[i].display();
  }
}

// \u30dc\u30fc\u30eb\u306e\u30af\u30e9\u30b9
class Ball{
  // \u30d7\u30ed\u30d1\u30c6\u30a3
  float x; // x\u5ea7\u6a19
  float y; // y\u5ea7\u6a19
  float xStep; // x\u65b9\u5411\u306e\u30b9\u30d4\u30fc\u30c9
  float yStep; // y\u65b9\u5411\u306e\u30b9\u30d4\u30fc\u30c9
  float diameter; // \u76f4\u5f84
  int c; // \u8272

  float gravity = 0.1f;
  float friction = 0.998f;
  // \u30b3\u30f3\u30b9\u30c8\u30e9\u30af\u30bf
  Ball(float _x, float _y){
    x = _x;
    y = _y;
    xStep = random(-5,5);
    yStep = random(-5,5);
    diameter = random(10,30);
    c = color(random(360), 80, 100);
  }
  // \u30a2\u30c3\u30d7\u30c7\u30fc\u30c8\u95a2\u6570\uff1a\u4f4d\u7f6e\u3084\u8272\u306a\u3069\u66f4\u65b0
  public void update(){
    // x\u5ea7\u6a19\u306bxStep(+5)\u3092\u8db3\u3059
    x += xStep;
    // y\u5ea7\u6a19\u306byStep(+5)\u3092\u8db3\u3059
    y += yStep;
    yStep += gravity;
    xStep *= friction;
    yStep *= friction;

    // \u3082\u3057\u30dc\u30fc\u30eb\u306ex\u5ea7\u6a19\u304c\u753b\u9762\u306e\u5916\u306b\u51fa\u305f\u5834\u5408
    // x > width : x\u5ea7\u6a19\u304c\u753b\u9762\u306e\u5e45\u3088\u308a\u5927\u304d\u3044
    // x < 0 : x\u5ea7\u6a19\u304c0\u3088\u308a\u5c0f\u3055\u3044
    if (x > width || x < 0) {
      //x = constrain(x,0,width);
      xStep = xStep * -1; //xStep\u306e\u65b9\u5411\u3092\u53cd\u8ee2
      c = color(random(360), 80, 100);
    }
    // \u3082\u3057\u30dc\u30fc\u30eb\u306ey\u304c\u753b\u9762\u306e\u5916\u306b\u51fa\u305f\u5834\u5408
    // y > height : y\u5ea7\u6a19\u304c\u753b\u9762\u306e\u9ad8\u3055\u3088\u308a\u5927\u304d\u3044
    // y < 0 : y\u5ea7\u6a19\u304c0\u3088\u308a\u5c0f\u3055\u3044
    if (y > height || y < 0) {
      //y = constrain(y,0,height);
      yStep = yStep * -1; //yStep\u306e\u65b9\u5411\u3092\u53cd\u8ee2
      c = color(random(360), 80, 100);
    }
    x = constrain(x,0,width);
    y = constrain(y,0,height);

  }
  // \u30c7\u30a3\u30b9\u30d7\u30ec\u30a4\u95a2\u6570\uff1a\u8868\u793a
  public void display(){
    noStroke();
    fill(c);
    ellipse(x,y,diameter,diameter);
  }
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_array_ball_gravity" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
