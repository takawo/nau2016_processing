import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import netP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_extra_oscP5_2_b extends PApplet {

//This code has been arranged by Yasushi Noguchi. Last updated on July 1, 2009.
//oscP5plug by andreas schlegel

//open sound control\u306e\u30e9\u30a4\u30d6\u30e9\u30ea\u3092\u8ffd\u52a0\u3059\u308b\uff08\u5fc5\u9808\uff09



OscP5 oscP5;    //\u53d7\u4fe1\u7528\u306e\u5909\u6570
NetAddress myRemoteLocation;    //\u9001\u4fe1\u7528\u306e\u30a2\u30c9\u30ec\u30b9\u3092\u4fdd\u6301\u3059\u308b\u5909\u6570

float x, y;    //\u76f8\u624b\u5074\u306ex, y\u5ea7\u6a19\u3092\u683c\u7d0d\u3059\u308b\u305f\u3081\u306e\u5909\u6570

public void setup() {
  
  colorMode(HSB,360,100,100);
  background(0);
  noStroke();

  //\u53d7\u4fe1\u7528\u306e\u5909\u6570\u3002\u53f3\u306e\u6570\u5b57\u306f\u30dd\u30fc\u30c8\u756a\u53f7\u3002\u9001\u4fe1\u5074\u306e\u30dd\u30fc\u30c8\u756a\u53f7\u3068\u3042\u308f\u305b\u308b\u3002
  oscP5 = new OscP5(this, 12000);

  //\u9001\u4fe1\u7528\u30aa\u30d6\u30b8\u30a7\u30af\u30c8\u3002\u5de6\u5074\u306e\u6570\u5b57\u304c\u76f8\u624b\u306eIP\u30a2\u30c9\u30ec\u30b9\u3001\u53f3\u5074\u304c\u76f8\u624b\u306e\u30dd\u30fc\u30c8\u756a\u53f7\u3002
  myRemoteLocation = new NetAddress("192.168.179.5", 10000);

  oscP5.plug(this, "getData", "/pattern");
}

//\u76f8\u624b\u5074\u304b\u3089\u306e\u30e1\u30c3\u30bb\u30fc\u30b8\u3092\u53d7\u3051\u53d6\u308b\u30b3\u30fc\u30c9\u3002fromA\u3068fromB\u3092\u305d\u308c\u305e\u308cx, y\u306b\u4ee3\u5165
public void getData(float fromA, float fromB) {
  x = fromA;
  y = fromB;
  println("I got: "+fromA+", "+fromB);
}

public void draw() {
  background(0, 0, 50);
  translate(-400,0);
  OscMessage myMessage = new OscMessage("/pattern");

  myMessage.add(x); //osc\u30e1\u30c3\u30bb\u30fc\u30b8\u3092\u8ffd\u52a0
  myMessage.add(y); //osc\u30e1\u30c3\u30bb\u30fc\u30b8\u3092\u8ffd\u52a0

  //\u30e1\u30c3\u30bb\u30fc\u30b8\u3092\u53d7\u4fe1\u5074\u306b\u9001\u308b
  oscP5.send(myMessage, myRemoteLocation);



  //\u5186\u3092\u63cf\u304f
  fill(255);
  ellipse(x, y, 30, 30);
}

//\u30ad\u30fc\u3092\u62bc\u3057\u305f\u3089\u753b\u9762\u306f\u5168\u3066\u9ed2\u306b\u306a\u308b
public void keyPressed() {
  background(0);
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_extra_oscP5_2_b" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
