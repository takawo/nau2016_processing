color c1, c2, c3;
String psecond = "";
PFont font; // 変数

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 200); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  font = createFont("SRM_test-Semibold", 150); //インストールしたシステムフォントとして読み込み
  textFont(font); // 使用するフォントに指定
  textAlign(CENTER, CENTER); // 縦横中央揃えに
  frameRate(60);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  String hour = str(100+hour()).substring(1, 3);
  String minute = str(100+minute()).substring(1, 3);
  String second = str(100+second()).substring(1, 3);
  println(psecond, second);
  if (psecond.equals(second) == false) {
    color p1 = c1;
    while (abs(hue(p1)-hue(c1))<30) {
      c1 = color(random(360), 80, 90);
      c2 = color((hue(c1)+120)%360, 80, 90);
      c3 = color((hue(c1)+240)%360, 80, 90);
    }
  }
  noStroke();
  fill(c1);
  rect(0, 0, 1/3f*width, height);
  fill(c2);
  rect(1/3f*width, 0, 1/3f*width, height);
  fill(c3);
  rect(2/3f*width, 0, 1/3f*width, height);

  fill(0, 0, 100);
  text(hour, (width/3)/2, height/2-30);
  text(minute, (width*1f/3f+width*2f/3f)/2f, height/2-30);
  text(second, (width*2f/3f+width*3f/3f)/2f, height/2-30);
  psecond = second;
  surface.setTitle(hour+":"+minute+":"+second);
}

// mouseMoved関数 : マウスがクリックされたときに実行される
void mouseMoved() {
}

// mousePressed関数 : マウスがクリックされたときに実行される
void mousePressed() {
}

// mouseReleased関数 : クリックが解放されたときに実行される
void mouseReleased() {
}

// mouseDraged関数 : マウスがドラッグされたときに実行される
void mouseDragged() {
}
