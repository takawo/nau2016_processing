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

public class sketch_xxx_csv_export extends PApplet {
  public void setup() {
PrintWriter output;
int num = 360;
String filename = nf(year(), 2) + nf(month(), 2) + nf(day(), 2) +"-"+ nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + "-" + num;
output = createWriter( filename + ".csv");

for (int i = 0; i < num; i++) {
  float value = random(100);
  output.println(i + "," + value);
}
output.flush();
output.close();
exit();
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_csv_export" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
