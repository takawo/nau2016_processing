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

public class sketch_161029a extends PApplet {



PImage map;
GoogleMapper gMapper;

public void setup() {



double maCenterLat =31.219293128780347f;
double mapCenterLon =121.55058860778809f;
int zoomLevel =15;
String mapType = GoogleMapper.MAPTYPE_HYBRID;
int mapWidth=1280;
int mapHeight=480;

gMapper = new GoogleMapper(maCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth,mapHeight);

map = gMapper.getMap();
}

public void draw() {

image(map,0,0);

saveFrame("map.jpg");

//println(gMapper.y2lat(240));//outputs 40.7782667
// println(gMapper.x2lon(320));//outputs -73.9698797
// println(gMapper.lat2y(31.219293128780347)); //outputs 240.0
// println(gMapper.lon2x(121.55058860778809));//outputs 320.0

}
  public void settings() { 
size(1280,480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161029a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
