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

public class sketch_016_variables extends PApplet {
  public void setup() {
/*
  \u30d7\u30ed\u30b0\u30e9\u30df\u30f3\u30b0\u306b\u304a\u3051\u308b\u8a08\u7b97\u3068\u4ee3\u5165\u306e\u57fa\u672c
 \u53f3\u8fba\u306e\u8a08\u7b97\u7d50\u679c\u3092\u5de6\u8fba\u3078\u4ee3\u5165\u3059\u308b

 \u25a0 Processing\u306e\u4ee3\u8868\u7684\u306a\u5909\u6570\u306e\u578b
 int : \u6574\u6570\u578b
 float : \u6d6e\u52d5\u5c0f\u6570\u70b9\u6570\u578b
 boolean : \u771f\u507d\u5024(true/false)
 char : \u6587\u5b57\uff081\u6587\u5b57\u3001\u30ad\u30e3\u30e9\u30af\u30bf\u30fc\uff09\u3001\u30ad\u30fc\u30dc\u30fc\u30c9\u306e\u30a4\u30d9\u30f3\u30c8\u306fString\u3067\u306f\u306a\u304f\u3053\u3061\u3089\u3092\u4f7f\u3046
 String : \u6587\u5b57\u5217\u3001\u30c6\u30ad\u30b9\u30c8\u306e\u8868\u793a\u306a\u3069\u306fchar\u3067\u306f\u306a\u304f\u3053\u3061\u3089\u3092\u4f7f\u3046

 \u25a0 Processing\u306e\u8a08\u7b97\u8a18\u53f7
 + : \u52a0\u7b97
 - : \u6e1b\u7b97
 * : \u4e57\u7b97
 / : \u9664\u7b97
 % : \u5270\u4f59\uff08\u4f59\u308a\uff09
 */

// \u6574\u6570\u578b(int)\u306e\u5909\u6570i\u306b100\u3092\u4ee3\u5165
int i = 100;
println(i); // 100\u304c\u51fa\u529b
// \u5909\u6570i\u306b{i(=100)+200}\u306e\u8a08\u7b97\u7d50\u679c\u3092\u4ee3\u5165
i = i + 200; // \u53c2\u8003\uff1ai += 200;\u3068\u3044\u3046\u3075\u3046\u306b\u3082\u66f8\u3051\u308b
println(i);

// \u6d6e\u52d5\u5c0f\u6570\u70b9\u6570\u578b(float)\u306e\u5909\u6570j\u306b3.141592\u3092\u4ee3\u5165
float j = 3.141592f;
println(j);
j = j * 10; // \u53c2\u8003\uff1aj *= 10;\u3068\u3044\u3046\u3075\u3046\u306b\u3082\u66f8\u3051\u308b
println(j);

// \u771f\u507d\u5024\u578b\u306e\u5909\u6570k\u306btrue\u3092\u4ee3\u5165
boolean k = true;
println(k);
k = !k; // \u5909\u6570k\u306e\u5024\u3092\u5165\u308c\u66ff\u3048\u308b(false\u306b);
println(k);

// \u6587\u5b57\u578b\u306e\u5909\u6570l\u306b'l'\u3092\u4ee3\u5165
char l = 'l'; // char\u306f\u4e00\u6587\u5b57\u3057\u304b\u4ee3\u5165\u3067\u304d\u306a\u3044
println(PApplet.parseInt(l)); // l\u306e\u6587\u5b57\u30b3\u30fc\u30c9\u3092\u51fa\u529b

// \u6587\u5b57\u5217\u578b\u306e\u5909\u6570m\u306b"morning"\u3092\u4ee3\u5165
String m = "morning";
println(m); // m\u3092\u51fa\u529b
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_016_variables" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
