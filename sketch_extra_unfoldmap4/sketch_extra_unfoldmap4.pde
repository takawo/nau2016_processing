import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

Table table;
ArrayList<Area> areas = new ArrayList<Area>();

UnfoldingMap map;
int currentLocation = 10000;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P2D);
  //fullScreen(P2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

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

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0);
  map.draw();
  float zoom = pow(map.getZoomLevel()/18f, 5);
  float size = map(zoom, 0, 1.0, 0.5, 50);
  println(zoom, size);
  fill(0, 80, 100, 50);
  noStroke();
  for (Area area : areas) {
    // Fixed-size marker
    ScreenPosition pos = map.getScreenPosition(area.loc);
    ellipse(pos.x, pos.y, size*2, size*2);
  }
}

void keyPressed() {
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