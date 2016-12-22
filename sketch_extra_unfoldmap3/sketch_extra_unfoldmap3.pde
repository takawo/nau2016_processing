import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

Table table;
ArrayList<Area> areas = new ArrayList<Area>();

UnfoldingMap map;
int currentLocation = 0;

// setup関数 : 初回1度だけ実行される
void setup() {
  fullScreen(P2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  table = loadTable("latlng_data.csv", "header");
  //println(table.getRowCount() + " total rows in table");
  for (TableRow row : table.rows()) {
    Area area = new Area();
    area.id = row.getInt("自治体コード")-1;
    area.pref_name = row.getString("都道府県名");
    area.city_name = row.getString("市区名");
    area.lat = row.getFloat("緯度");
    area.lng = row.getFloat("経度");
    area.loc = new Location(area.lat, area.lng);
    areas.add(area);
  }

  map = new UnfoldingMap(this);
  map.setTweening(true);
  map.zoomAndPanTo(areas.get(currentLocation).loc, 8);
  MapUtils.createDefaultEventDispatcher(this, map);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0);
  map.draw();
  int i = 0;
  for (Area area : areas) {
    // Fixed-size marker
    ScreenPosition pos = map.getScreenPosition(area.loc);
    if (i == currentLocation) {
      fill(0, 80, 100, 100);
    } else {
      fill(220, 80, 100, 100);
    }
    noStroke();
    ellipse(pos.x, pos.y, 20, 20);
    i++;
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

void keyPressed() {
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
