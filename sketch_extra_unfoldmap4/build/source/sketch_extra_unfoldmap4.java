import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import de.fhpotsdam.unfolding.*; 
import de.fhpotsdam.unfolding.geo.*; 
import de.fhpotsdam.unfolding.utils.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_extra_unfoldmap4 extends PApplet {





Table table;
ArrayList<Area> areas = new ArrayList<Area>();

UnfoldingMap map;
int currentLocation = 10000;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
  
  //fullScreen(P2D); // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b

  table = loadTable("zip_geocodes.csv", "header");
  //println(table.getRowCount() + " total rows in table");
  for (TableRow row : table.rows()) {
    Area area = new Area();
    area.id = row.getInt("id")-1;
    area.zip_code = row.getString("zip_code").toString();
    area.lat = row.getFloat("longitude");
    area.lng = row.getFloat("latitude");
    area.loc = new Location(area.lat, area.lng);
    areas.add(area);
  }

  map = new UnfoldingMap(this);
  map.zoomAndPanTo(areas.get(currentLocation).loc, 6);
  MapUtils.createDefaultEventDispatcher(this, map);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0);
  map.draw();
  float zoom = pow(map.getZoomLevel()/18f, 5);
  float size = map(zoom, 0, 1.0f, 0.5f, 50);
  println(zoom, size);
  fill(0, 80, 100, 50);
  noStroke();
  for (Area area : areas) {
    // Fixed-size marker
    ScreenPosition pos = map.getScreenPosition(area.loc);
    ellipse(pos.x, pos.y, size*2, size*2);
  }
}

public void keyPressed() {
}

class Area {
  int id;
  String zip_code;
  float lat;
  float lng;
  Location loc;
  Area() {
  }
}
  public void settings() {  size(960, 540, P2D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_extra_unfoldmap4" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
