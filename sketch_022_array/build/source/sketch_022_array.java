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

public class sketch_022_array extends PApplet {
  public void setup() {
// int\u578b\u306e\u914d\u5217numArray(\u8981\u7d20\u6570: 5):

int[] numArray = new int[5];

// \u8981\u7d20\u3054\u3068\u3078\u306e\u4ee3\u5165\u306e\u4ed5\u65b9
numArray[0] = 10; //0\u756a\u76ee\uff08\u6700\u521d\uff09\u306e\u914d\u5217\u306b10\u3092\u4ee3\u5165\uff08\u4ee5\u4e0b\u540c\u69d8\uff09
numArray[1] = 15;
numArray[2] = 20;
numArray[3] = 25;
numArray[4] = 30;

// \u547c\u3073\u51fa\u3057\u65b9
println("numArray[2]",numArray[2]);

// \u533a\u5207\u308a\u306e\u51fa\u529b
println("-----------------------");

// \u914d\u5217\u8981\u7d20\u306e\u51fa\u529b : printArray\u95a2\u6570
printArray(numArray);
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_022_array" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
