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

public class sketch_xxx_saveFrame extends PApplet {

int i = 0;
int offset = 30;
public void setup() {
  
}

public void draw()
{
  background(255);
  fill(0);

  textSize(400);
  textAlign(CENTER, CENTER);

  if (frameCount < 60) {
    text(str(frameCount), 0, 0, width, height-offset);
    saveFrame(sketchPath() + "/data/text####.png");
  }else{
    exit();
  }
}
  public void settings() {  size(960, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_saveFrame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
