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

public class sketch_002_comment extends PApplet {
  public void setup() {
// \u30b9\u30e9\u30c3\u30b7\u30e5(/)\u30922\u3064\u7d9a\u3051\u3066\u66f8\u304f\u3053\u3068\u3067\u30b3\u30e1\u30f3\u30c8\u306b\u306a\u308b
// \u30b3\u30e1\u30f3\u30c8\u90e8\u5206\u306f\u5b9f\u884c\u3055\u308c\u306a\u3044

/*
\u9577\u3044\u30b3\u30e1\u30f3\u30c8\u306f
\u30b9\u30e9\u30c3\u30b7\u30e5\u3068
\u30a2\u30b9\u30bf\u30ea\u30b9\u30af(*)\u3067
\u56f2\u3046\u3053\u3068\u3067
\u30b3\u30e1\u30f3\u30c8\u6271\u3044\u306b\u306a\u308b
*/

// \u30d7\u30ed\u30b0\u30e9\u30e0\u306e\u4e2d\u306b\u30e1\u30e2\u3068\u3057\u3066\u4f7f\u3046\u3068\u304d\u306e\u4f8b
println("message"); // \u30b3\u30f3\u30bd\u30fc\u30eb\u306bmessage\u3068\u51fa\u529b
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_002_comment" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
