Table table;
ArrayList<Float> values = new ArrayList<Float>();
float r = 250;
float maxValue = 0;
float minValue = 100;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(8); // 描画を滑らかに
  table = loadTable("20161231-011112-360.csv");

  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    float value = row.getFloat(1);
    values.add(value);    
    maxValue = max(maxValue, value);
    minValue = min(minValue, value);
  }
  println(maxValue, minValue);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  translate(width/2, height/2);
  for (int i = 0; i < values.size(); i++) {
    float theta = map(i, 0, values.size(), 0, TWO_PI);
    float value = values.get(i); //+noise(theta*10,values.get(i)/100f,frameCount/100f)*20;
    float r2 = map(value, minValue, maxValue, r, r-100);
    float x1 = cos(theta) * r;
    float y1 = sin(theta) * r;
    float x2 = cos(theta) * r2;
    float y2 = sin(theta) * r2;
    color c = color(0, 0, 50);
    strokeWeight(r/values.size()*3);
    stroke(c);
    line(x1, y1, x2, y2);
  }
}