import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import megamu.mesh.*; 
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

public class sketch_extra_unfoldmap7 extends PApplet {







Table table;
ArrayList<Area> areas = new ArrayList<Area>();
float[][] points;

UnfoldingMap map;
int currentLocation = 0;

Delaunay myDelaunay;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b

  table = loadTable("latlng_data.csv", "header");
  //println(table.getRowCount() + " total rows in table");
  for (TableRow row : table.rows()) {
    Area area = new Area();
    area.id = row.getInt("\u81ea\u6cbb\u4f53\u30b3\u30fc\u30c9")-1;
    area.pref_name = row.getString("\u90fd\u9053\u5e9c\u770c\u540d");
    area.city_name = row.getString("\u5e02\u533a\u540d");
    area.lat = row.getFloat("\u7def\u5ea6");
    area.lng = row.getFloat("\u7d4c\u5ea6");
    area.loc = new Location(area.lat, area.lng);
    areas.add(area);
  }

  points = new float[areas.size()][2];

  map = new UnfoldingMap(this);
  map.setTweening(true);
  map.zoomAndPanTo(areas.get(currentLocation).loc, 8);
  MapUtils.createDefaultEventDispatcher(this, map);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0);
  map.draw();
  myDelaunay = new Delaunay( points );
  int[][] myLinks = myDelaunay.getLinks();
  for (int i=0; i<myLinks.length; i++) {
    int startIndex = myLinks[i][0];
    int endIndex = myLinks[i][1];

    float startX = points[startIndex][0];
    float startY = points[startIndex][1];
    float endX = points[endIndex][0];
    float endY = points[endIndex][1];
    strokeWeight(3);
    if (startIndex == currentLocation || endIndex== currentLocation) {
      stroke(0, 80, 100, 50);
    } else {
      stroke(220, 80, 100, 50);
    }
    line( startX, startY, endX, endY );
  }


  int j = 0;
  for (Area area : areas) {
    // Fixed-size marker
    ScreenPosition pos = map.getScreenPosition(area.loc);
    if (j == currentLocation) {
      fill(0, 80, 100, 100);
    } else {
      fill(220, 80, 100, 100);
    }
    noStroke();
    ellipse(pos.x, pos.y, 20, 20);
    points[j][0] = pos.x;
    points[j][1] = pos.y;
    j++;
  }

  if (frameCount % 120 == 0) {
    currentLocation = (int)random(areas.size());
    map.panTo(areas.get(currentLocation).loc);
    //currentLocation++;
    if (currentLocation >= areas.size()) {
      //currentLocation = 0;
    }
  }
}

public void keyPressed() {
  if (key == ' ') {
    map.switchTweening();
  }
}

class Area {
  int id;
  String pref_name;
  String city_name;
  float lat;
  float lng;
  Location loc;
  Area() {
  }
}
  public void settings() {  fullScreen(P2D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_extra_unfoldmap7" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
