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

public class sketch_001_println extends PApplet {
  public void setup() {
// println()\u3068\u3044\u3046\u95a2\u6570\u3067\u6587\u5b57\u3092\u51fa\u529b\u3059\u308b
println("Hello World");
println("\u65e5\u672c\u8a9e\u3082\u51fa\u529b\u3067\u304d\u307e\u3059");

// \u30e1\u30c3\u30bb\u30fc\u30b8\u306f\u6570\u5b57\u3082\u51fa\u529b\u3067\u304d\u308b
println(3.141592f);

// \u6587\u5b57\u3092\u51fa\u529b\u3059\u308b\u5834\u5408\u306f\u3001""(\u30c0\u30d6\u30eb\u30af\u30a9\u30fc\u30c6\u30fc\u30b7\u30e7\u30f3)\u3067\u56f2\u3046
// \u3053\u308c\u306f\u30a8\u30e9\u30fc\u306b\u306a\u308b
// println(Hello World);
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_001_println" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
