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

public class sketch_xxx_manipulatingStrings extends PApplet {
  public void setup() {
/* split */

// String word = "The quick brown fox jumps over the lazy dog.";

/* example 1 */
// String[] wordArray1 = splitTokens(word," ");
// printArray(wordArray1);

/* example 2 */
// String[] wordArray2 = split(word," ");
// printArray(wordArray2);

/* example 3 */
// String stuff = "hats & apples, cars + phones % elephants dog.";
// String[] list = splitTokens(stuff, " &,+.");
// printArray(list);

/* example 4 */
// String numbers = "8,67,5,309";
// int[] list = int(split(numbers, ','));
// printArray(list);
//
// int sum = 0;
// for (int i = 0; i < list.length; i++) {
//   sum = sum + list[i];
// }
// println(sum);

/* join */

// String[] lines = {"It", "was", "a", "dark", "and", "stormy", "night."};

/* example 1 */
// String onLongString = join(lines," ");
// println(onLongString);

/* example 2 // Manual Concatenation */
// String onLongString = "";
// for (int i = 0; i < lines.length; i++) {
//   onLongString += lines[i] + " ";
// }
// println(onLongString);
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_manipulatingStrings" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
