import gifAnimation.*;

// 変数
GifMaker gifExport;
boolean isRecord = false;
int grid = 10;
float rectSize = grid;
float max_distance = 500;
PImage img;
PImage[] imgs;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100);
  img = loadImage("animals-q-c-960-540-4.jpg");
  gifSetup();
  int i = 0;
  imgs = new PImage[(int)(img.height/grid) * (int)(img.width/grid)];
  for (int y = 0; y < img.height; y += grid) {
    for (int x = 0; x < img.width; x += grid) {
      imgs[i] = img.get(x,y,(int)grid,(int)grid);
      i++;
    }
  }
  println(i);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  int i = 0;
  for (int y = 0; y < height; y += grid) {
    for (int x = 0; x < width; x += grid) {
      float dist = dist(mouseX, mouseY, x, y);
      float z = dist/max_distance * 40*10;
      pushMatrix();
      translate(x,y,z);
      //rect(0,0,rectSize,rectSize);
      image(imgs[i],0,0);
      popMatrix();
      i++;
    }
  }

  gifRecord();
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