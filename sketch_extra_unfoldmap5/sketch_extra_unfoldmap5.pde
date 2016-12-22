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

ArrayList<Station> stations = new ArrayList<Station>();
ArrayList<Line> lines = new ArrayList<Line>();
UnfoldingMap map;
DebugDisplay debugDisplay;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
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

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0);
  map.draw();
  debugDisplay.draw();
  stroke(220, 80, 100, 100);
  strokeWeight(5);
  for (Line line : lines) {
    for (int i = line.stations.size()-1; i > 0; i--) {
      Station s1 = line.stations.get(i);
      Station s2 = line.stations.get(i-1);
      ScreenPosition pos1 = map.getScreenPosition(s1.loc);
      ScreenPosition pos2 = map.getScreenPosition(s2.loc);
      line(pos1.x, pos1.y, pos2.x, pos2.y);
    }
  }

  
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