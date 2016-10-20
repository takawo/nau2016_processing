import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_extra_controlp5_0x_colorweel extends PApplet {

// \u30e9\u30a4\u30d6\u30e9\u30ea\u306e\u30a4\u30f3\u30dd\u30fc\u30c8


ControlP5 cp5; // UI\u30e9\u30a4\u30d6\u30e9\u30eaControlP5\u306e\u30a4\u30f3\u30b9\u30bf\u30f3\u30b9
Slider sliderX; // Slider\u306e\u30a4\u30f3\u30b9\u30bf\u30f3\u30b9
Slider sliderY; // Slider\u306e\u30a4\u30f3\u30b9\u30bf\u30f3\u30b9
ColorWheel colorWheel; // ColorWheel\u306e\u30a4\u30f3\u30b9\u30bf\u30f3\u30b9

float x; // x\u5ea7\u6a19
float y; // y\u5ea7\u6a19
float diameter; //\u76f4\u5f84

int fillColor; //\u63cf\u753b\u8272
int bgColor; //\u80cc\u666f\u8272\uff08\u63cf\u753b\u8272\u306e\u88dc\u8272\uff09

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // \u30ab\u30e9\u30fc\u30e2\u30fc\u30c9\u3092HSB\u306b
  fillColor = color(random(360),80,100); // fillColor\u306e\u5024\u3092\u30e9\u30f3\u30c0\u30e0\u306b
  cp5 = new ControlP5(this); // ControlP5\u306e\u521d\u671f\u5316

  // ControlP5\u306b\u30dc\u30bf\u30f3\u306eUI\u3092\u8ffd\u52a0
  // ControlP5\u306f\u3053\u3093\u306a\u98a8\u306b\u547d\u4ee4\u3092.\u3067\u7d9a\u3051\u3066\u66f8\u3051\u308b(\u30e1\u30bd\u30c3\u30c9\u30c1\u30a7\u30fc\u30f3)
  sliderX = cp5.addSlider("x") //\u5909\u6570x\u3068\u7d10\u4ed8\u3051
    .setLabel("x") // \u30e9\u30d9\u30eb\uff1a\u30dc\u30bf\u30f3\u306e\u30bf\u30a4\u30c8\u30eb
    .setSize(200, 20) // \u30b5\u30a4\u30ba\u6307\u5b9a
    .setRange(0, width) // \u30b9\u30e9\u30a4\u30c0\u30fc\u306e\u6700\u5c0f\u5024\u3068\u6700\u5927\u5024\u3092\u6307\u5b9a
    .setValue(width/2) // \u30b9\u30e9\u30a4\u30c0\u30fc\u306e\u521d\u671f\u5024\u3092\u6307\u5b9a
    .setPosition(40, 20); // \u4f4d\u7f6e\u6307\u5b9a

  sliderY = cp5.addSlider("y") //\u5909\u6570x\u3068\u7d10\u4ed8\u3051
    .setLabel("y") // \u30e9\u30d9\u30eb\uff1a\u30dc\u30bf\u30f3\u306e\u30bf\u30a4\u30c8\u30eb
    .setRange(0, height) // \u30b9\u30e9\u30a4\u30c0\u30fc\u306e\u6700\u5c0f\u5024\u3068\u6700\u5927\u5024\u3092\u6307\u5b9a
    .setValue(height/2) // \u30b9\u30e9\u30a4\u30c0\u30fc\u306e\u521d\u671f\u5024\u3092\u6307\u5b9a
    .setSize(200, 20) // \u30b5\u30a4\u30ba\u6307\u5b9a
    .setPosition(40, 40); // \u4f4d\u7f6e\u6307\u5b9a

    sliderY = cp5.addSlider("diameter") //\u5909\u6570diameter\u3068\u7d10\u4ed8\u3051
      .setLabel("diameter") // \u30e9\u30d9\u30eb\uff1a\u30dc\u30bf\u30f3\u306e\u30bf\u30a4\u30c8\u30eb
      .setRange(0, 540) // \u30b9\u30e9\u30a4\u30c0\u30fc\u306e\u6700\u5c0f\u5024\u3068\u6700\u5927\u5024\u3092\u6307\u5b9a
      .setValue(200) // \u30b9\u30e9\u30a4\u30c0\u30fc\u306e\u521d\u671f\u5024\u3092\u6307\u5b9a
      .setSize(200, 20) // \u30b5\u30a4\u30ba\u6307\u5b9a
      .setPosition(40, 60); // \u4f4d\u7f6e\u6307\u5b9a

  colorWheel = cp5.addColorWheel("fillColor") // \u30ab\u30e9\u30fc\u30db\u30a4\u30fc\u30eb\u3092\u8ffd\u52a0\u3057fillColor\u3068\u7d10\u4ed8\u3051
    .setPosition(40, 80); //\u4f4d\u7f6e\u6307\u5b9a

}



// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  bgColor = color((hue(fillColor)+180)%360,saturation(fillColor),brightness(fillColor));

  background(bgColor); // \u80cc\u666f\u8272\u3092bgColor\u306b\u6307\u5b9a
  noStroke(); // \u7dda\u306e\u8272\u3092\u30ca\u30b7\u306b\u6307\u5b9a
  fill(fillColor); // \u5857\u308a\u3064\u3076\u3057\u306e\u8272\u3092fillColor\u306b

  // \u5186\u3092\u63cf\u753b(x,y\u306e\u5024\u306fslider\u3092\u64cd\u4f5c\u3059\u308b\u3068\u5909\u5316\u3059\u308b)
  ellipse(x, y, diameter, diameter);
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_extra_controlp5_0x_colorweel" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
