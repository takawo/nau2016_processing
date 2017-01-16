import generativedesign.*;
import gifAnimation.*;

// 変数
GifMaker gifExport;
boolean isRecord = false;
color[] baseColors;
color[] colors;
float tileCountX;
float tileCountY;
float tileSizeX;
float tileSizeY;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();

  gifSetup();
  tileSetup();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  //background(0, 0, 100);
  for (float y = 0; y < height; y += tileSizeY) {
    tileCountX = floor(random(1, 20));
    tileSizeX = width/tileCountX;
    for (float x = 0; x < width; x += tileSizeX) {
      if (random(1) < 0.5) {
        color c = baseColors[int(random(baseColors.length))];
        fill(c);
        rect(x, y, tileSizeX, tileSizeY);
      } else {
        float tileSizeX2 = random(2, tileSizeX/5);
        for (float x2 = x; x2 < x+tileSizeX; x2+= tileSizeX2) {
          color c = baseColors[int(random(baseColors.length))];
          fill(c);
          rect(x2, y, tileSizeX2, tileSizeY);
        }
      }
    }
  }
  noLoop();
  gifRecord();
}

/*
**  マウスイベント（クリック・ドラッグ）関数
 */

// mousePressed関数 : クリックした時
void mousePressed() {
  tileSetup();
  redraw();
}

void tileSetup() {
  int baseColorLength = (int)random(10, 20);
  baseColors = new color[baseColorLength];
  for (int i = 0; i < baseColorLength; i++) {
    float hue = 0;
    float saturation = 0;
    float brightness = 0;
    if (random(1) < 0.5) {
      hue = random((180+frameCount*30)%360, (360+frameCount*30)%360);
      saturation = random(80, 100);
      brightness = random(50, 100);
    } else {
      hue = random((180+frameCount*30)%360, (360+frameCount*30)%360);
      saturation = random(0, 30);
      brightness = random(100);
    }
    baseColors[i] = color(hue, saturation, brightness);
  }
  tileCountY = 20f;
  tileSizeY = height/tileCountY;
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
    String fileName = str(year()) + str(month()+100).substring(1) + str(day()+100).substring(1) + "-" +  
      str(hour()+100).substring(1) + str(minute()+100).substring(1) + str(second()+100).substring(1);
    gifExport = new GifMaker(this, fileName +".gif");
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