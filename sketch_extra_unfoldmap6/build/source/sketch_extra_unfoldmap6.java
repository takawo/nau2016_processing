import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import de.fhpotsdam.unfolding.*; 
import de.fhpotsdam.unfolding.core.*; 
import de.fhpotsdam.unfolding.data.*; 
import de.fhpotsdam.unfolding.events.*; 
import de.fhpotsdam.unfolding.geo.*; 
import de.fhpotsdam.unfolding.interactions.*; 
import de.fhpotsdam.unfolding.mapdisplay.*; 
import de.fhpotsdam.unfolding.mapdisplay.shaders.*; 
import de.fhpotsdam.unfolding.marker.*; 
import de.fhpotsdam.unfolding.providers.*; 
import de.fhpotsdam.unfolding.texture.*; 
import de.fhpotsdam.unfolding.tiles.*; 
import de.fhpotsdam.unfolding.ui.*; 
import de.fhpotsdam.unfolding.utils.*; 
import de.fhpotsdam.utils.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_extra_unfoldmap6 extends PApplet {

















ArrayList<Station> stations = new ArrayList<Station>();
ArrayList<Line> lines = new ArrayList<Line>();
UnfoldingMap map;
DebugDisplay debugDisplay;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  Table table = loadTable("station20161107free.csv", "header");
  println(table.getRowCount() + " total rows in table");
  for (TableRow row : table.rows()) {
    Station station = new Station();
    station.station_cd = row.getInt("station_cd");
    station.station_g_cd = row.getInt("station_g_cd");
    station.station_name = row.getString("station_name");
    station.line_cd = row.getInt("line_cd");
    station.lat = row.getFloat("lat");
    station.lon = row.getFloat("lon");
    station.loc = new Location(station.lat, station.lon);
    stations.add(station);
  }

  Line line = new Line();
  int current_line_cd = 0;
  int i =0;
  for (Station s : stations) {
    if (current_line_cd != 0 && s.line_cd != current_line_cd) {
      lines.add(line);
      line = null;
      line = new Line();
      line.stations.add(s);
    } else {
      line.stations.add(s);
    }
    current_line_cd = s.line_cd;
    i++;
  }
  map = new UnfoldingMap(this);
  map.zoomAndPanTo(stations.get(100).loc, 5);
  MapUtils.createDefaultEventDispatcher(this, map);
  debugDisplay = new DebugDisplay(this, map);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0);
  map.draw();
  debugDisplay.draw();
  stroke(220, 80, 100, 100);
  strokeWeight(5);
  for(Line line : lines){
    beginShape();
    for (int i = 0; i < line.stations.size(); i++) {
    Station s = line.stations.get(i);
    ScreenPosition pos = map.getScreenPosition(s.loc);
    curveVertex(pos.x, pos.y);
    if(i == 0 || i == lines.size()-1){
      curveVertex(pos.x, pos.y);
      }
    }
    endShape();
  }
  // for (Line line : lines) {
  //   for (int i = line.stations.size()-1; i > 0; i--) {
  //     Station s1 = line.stations.get(i);
  //     Station s2 = line.stations.get(i-1);
  //     ScreenPosition pos1 = map.getScreenPosition(s1.loc);
  //     ScreenPosition pos2 = map.getScreenPosition(s2.loc);
  //     line(pos1.x, pos1.y, pos2.x, pos2.y);
  //   }
  // }
  //

  fill(0, 80, 100, 100);
  noStroke();
  for (Station station : stations) {
    // Fixed-size marker
    ScreenPosition pos = map.getScreenPosition(station.loc);
    ellipse(pos.x, pos.y, 5, 5);
  }
}

class Station {
  int station_cd;
  int station_g_cd;
  String station_name;
  int line_cd;
  float lon;
  float lat;
  Location loc;
}

class Line {
  ArrayList<Station> stations = new ArrayList<Station>();
  Line() {
  }
}
  public void settings() {  size(960, 540, P2D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_extra_unfoldmap6" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
