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

public class sketch_023_array_for extends PApplet {
  public void setup() {
int n = 20;

// int\u578b\u306e\u914d\u5217numArray(\u8981\u7d20\u6570: n):
int[] numArray = new int[n];

/*
   // for\u30eb\u30fc\u30d7\uff08\u7e70\u308a\u8fd4\u3057\u51e6\u7406\uff09 //
   int i = 0; // 1.\u521d\u671f\u5024
   i < n; // 2.\u6761\u4ef6\uff08if\u6587\u3068\u540c\u3058\uff09
   i += 1; // 3.\u6761\u4ef6\u304ctrue\u306e\u3068\u304d\u3001{}\u306e\u5b9f\u884c\u5f8c\u306e\u51e6\u7406
   {}\u306e\u4e2d\u8eab\u306f\u6761\u4ef6\u3092\u6e80\u305f\u3057\u305f\u3068\u304d\u5b9f\u884c\u3055\u308c\u308b
*/

for(int i = 0; i < n; i += 1){
  numArray[i] = i*5;
  println(i);
}

// \u533a\u5207\u308a\u6587\u5b57\u306e\u51fa\u529b
println("-----------------");

// \u914d\u5217\u306e\u8981\u7d20\u306e\u51fa\u529b
printArray(numArray);

// \u533a\u5207\u308a\u6587\u5b57\u306e\u51fa\u529b
println("-----------------");

// \u62e1\u5f35for\u6587\uff08\u767a\u5c55\u7248\uff09
// \u3053\u3093\u306a\u98a8\u306b\u8981\u7d20\u306b\u51e6\u7406\u3092\u3057\u3066\u3044\u304f\u3053\u3068\u3082\u3067\u304d\u308b
// for(int i : numArray){
//   println(i);
// }
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_023_array_for" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
