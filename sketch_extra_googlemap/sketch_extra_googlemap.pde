// Google Mapライブラリの読み込み
import googlemapper.*;
// googleMapper.jarをダウンロードしてpdeがある階層にcodeフォルダを作成し、そこにコピーする

PImage map; // 地図の画像
GoogleMapper gMapper; // GoogleMapperのインスタンス

void setup() {
  size(960,540);

  double maCenterLat = 35.367567; // 緯度
  double mapCenterLon = 136.639469; // 経度
  int zoomLevel =17; //マップのズームレベル

  // マップタイプの指定
  // String mapType = GoogleMapper.MAPTYPE_TERRAIN; // 地形
  // String mapType = GoogleMapper.MAPTYPE_SATELITE; // 衛星写真
  String mapType = GoogleMapper.MAPTYPE_ROADMAP; // ハイブリッド

  // マップのサイズ
  int mapWidth=width;
  int mapHeight=height;

  // インスタンスの初期化
  gMapper = new GoogleMapper(maCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth,mapHeight);

  // イメージとして取得
  map = gMapper.getMap();
}

void draw() {

  // イメージを表示
  image(map,0,0);

  //saveFrame("map.jpg");

}
