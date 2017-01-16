import gifAnimation.*;

// 変数
GifMaker gifExport;
boolean isRecord = false;
PVector p;
PVector pp;
PVector v;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100);
  smooth(8);
  p = new PVector(width/2, height/2);
  pp = p.get();
  v = PVector.random2D();
  gifSetup();
  background(0, 0, 100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  for (int i = 0; i < 10; i ++) { 
    checkBorder();
    update();
    checkEdge();
    pp = p.get();
  }
  gifRecord();
}

void checkBorder() {
  PVector nv = v.get().mult(3);
  PVector np = p.get().add(nv);

  color c = get((int)np.x, (int)np.y);
  if (brightness(c) < 1) {
    float theta = 0;
    if (random(1) > 0.5) {
      theta = -PI/4;
    } else {
      theta = PI/4;
    }
    v.rotate(theta);
  }
}



void update() {
  p.add(v);
  strokeWeight(1);
  line(p.x, p.y, pp.x, pp.y);
}

void checkEdge() {
  if (p.x < 0 || p.x > width) {
    v.x *= -1;
  }
  if (p.y < 0 || p.y > height) {
    v.y *= -1;
  }
}

/*
**  マウスイベント（クリック・ドラッグ）関数
 */

// mousePressed関数 : クリックした時
void mousePressed() {
}

// mouseReleased関数 : クリックを離した時
void mouseReleased() {
}
// mouseDragged関数：マウスをドラッグしたとき
void mouseDragged() {
}

// mouseMoved関数：マウスを動かしたとき
void mouseMoved() {
}

// keyPressed関数：キーボードのキーをタイプした時
void keyPressed() {
}

// keyPressed関数：キーボードのキーを押して離した時
void keyReleased() {
}

void gifSetup() {
  if (isRecord) {
    gifExport = new GifMaker(this, getClass().getSimpleName() +".gif"); // ファイル名のGIFアニメーションを作成
    gifExport.setRepeat(0); // エンドレス再生
    gifExport.setQuality(10); // クオリティ(デフォルト10)
    gifExport.setDelay(33); // アニメーションの間隔を30ms(33fps)に
  }
}
void gifRecord() {
  if (isRecord) {
    //GIFアニメーションの保存 
    if (frameCount <= 30*3) {
      gifExport.addFrame(); // フレームを追加
    } else {
      gifExport.finish();
      println("gif saved");
    }
  }
}