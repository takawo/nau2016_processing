import googlemapper.*;

PImage map;
GoogleMapper gMapper;

public void setup() {

size(1280,480);

double maCenterLat =31.219293128780347;
double mapCenterLon =121.55058860778809;
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
