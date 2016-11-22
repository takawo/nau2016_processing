// GIFアニメーション再生のためのライブラリ「gifAnimation」の読み込み
import gifAnimation.*;

// 変数
GifMaker gifExport; // GIFアニメーション出力用インスタンス
int fps = 30; // フレームレート
int duration = 3; // GIFアニメーションの記録秒数

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(fps);
  gifExport = new GifMaker(this, "./data/"+getClass().getSimpleName() +".gif"); // ファイル名のGIFアニメーションを作成
  gifExport.setRepeat(0); // エンドレス再生
  gifExport.setQuality(10); // クオリティ(デフォルト10)
  gifExport.setDelay(1000/fps); // アニメーションの間隔を30ms(33fps)に
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  noStroke();
  fill(220, 80, 100);
  float t = map(noise(width/2, frameCount*0.03), 0, 1, -1, 1);
  float s = map(noise(height/2, frameCount*0.03), 0, 1, -1, 1);
  float x = width/2 + t*250;
  float y = height/2 + s*250;
  ellipse(x, y, 100, 100);
  gifExport.addFrame();

  //GIFアニメーションの保存
  if (frameCount <= fps*duration) {
    gifExport.addFrame(); // フレームを追加
  } else {
    gifExport.finish(); // 終了してファイル保存
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
  if (key == 's' || key == 'S') {
    gifExport.finish();
    println("gif saved.");
  }
}

// keyPressed関数：キーボードのキーを押して離した時
void keyReleased() {
}
