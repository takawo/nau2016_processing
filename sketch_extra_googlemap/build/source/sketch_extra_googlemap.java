import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import googlemapper.*; 

import googlemapper.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_extra_googlemap extends PApplet {

// Google Map\u30e9\u30a4\u30d6\u30e9\u30ea\u306e\u8aad\u307f\u8fbc\u307f

// googleMapper.jar\u3092\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u3057\u3066pde\u304c\u3042\u308b\u968e\u5c64\u306bcode\u30d5\u30a9\u30eb\u30c0\u3092\u4f5c\u6210\u3057\u3001\u305d\u3053\u306b\u30b3\u30d4\u30fc\u3059\u308b

PImage map; // \u5730\u56f3\u306e\u753b\u50cf
GoogleMapper gMapper; // GoogleMapper\u306e\u30a4\u30f3\u30b9\u30bf\u30f3\u30b9

public void setup() {
  

  double maCenterLat = 35.367567f; // \u7def\u5ea6
  double mapCenterLon = 136.639469f; // \u7d4c\u5ea6
  int zoomLevel =17; //\u30de\u30c3\u30d7\u306e\u30ba\u30fc\u30e0\u30ec\u30d9\u30eb

  // \u30de\u30c3\u30d7\u30bf\u30a4\u30d7\u306e\u6307\u5b9a
  // String mapType = GoogleMapper.MAPTYPE_TERRAIN; // \u5730\u5f62
  // String mapType = GoogleMapper.MAPTYPE_SATELITE; // \u885b\u661f\u5199\u771f
  String mapType = GoogleMapper.MAPTYPE_ROADMAP; // \u30cf\u30a4\u30d6\u30ea\u30c3\u30c9

  // \u30de\u30c3\u30d7\u306e\u30b5\u30a4\u30ba
  int mapWidth=width;
  int mapHeight=height;

  // \u30a4\u30f3\u30b9\u30bf\u30f3\u30b9\u306e\u521d\u671f\u5316
  gMapper = new GoogleMapper(maCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth,mapHeight);

  // \u30a4\u30e1\u30fc\u30b8\u3068\u3057\u3066\u53d6\u5f97
  map = gMapper.getMap();
}

public void draw() {

  // \u30a4\u30e1\u30fc\u30b8\u3092\u8868\u793a
  image(map,0,0);

  //saveFrame("map.jpg");

}
  public void settings() {  size(960,540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_extra_googlemap" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
