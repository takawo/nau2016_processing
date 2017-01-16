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

public class sketch_extra_oscP5_2_a extends PApplet {




OscP5 oscP5;
NetAddress myRemoteLocation;
PVector p;
PVector vel;

public void setup() {
  
  colorMode(HSB, 360, 100, 100);
  noStroke();

  oscP5 = new OscP5(this, 10000);
  myRemoteLocation = new NetAddress("192.168.179.5", 12000);
  oscP5.plug(this, "getData", "/pattern");
  p = new PVector(width/2,height/2);
  vel = PVector.random2D();
  vel.mult(3);
}

//\u76f8\u624b\u5074\u304b\u3089\u306e\u30e1\u30c3\u30bb\u30fc\u30b8\u3092\u53d7\u3051\u53d6\u308b\u30b3\u30fc\u30c9\u3002fromA\u3068fromB\u3092\u305d\u308c\u305e\u308cx, y\u306b\u4ee3\u5165
public void getData(PVector _p) {
  p = _p.get();
  //println("I got: "+p.x+", "+p.y);
}

public void draw() {
  background(0, 0, 100);
  p.add(vel);

  {
    OscMessage myMessage = new OscMessage("/pattern");
    myMessage.add(p.x); //osc\u30e1\u30c3\u30bb\u30fc\u30b8\u3092\u8ffd\u52a0
    myMessage.add(p.y); //osc\u30e1\u30c3\u30bb\u30fc\u30b8\u3092\u8ffd\u52a0
    //\u30e1\u30c3\u30bb\u30fc\u30b8\u3092\u53d7\u4fe1\u5074\u306b\u9001\u308b
    oscP5.send(myMessage, myRemoteLocation);
  }

  //\u5186\u3092\u63cf\u304f
  fill(255);
  ellipse(p.x, p.y, 30, 30);

  if (p.x < 0 || p.x > width*2) {
    vel.x *= -1;
  }
  if (p.y < 0 || p.y > height) {
    vel.y *= -1;
  }
}

//\u30ad\u30fc\u3092\u62bc\u3057\u305f\u3089\u753b\u9762\u306f\u5168\u3066\u9ed2\u306b\u306a\u308b
public void keyPressed() {
  background(0);
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_extra_oscP5_2_a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
