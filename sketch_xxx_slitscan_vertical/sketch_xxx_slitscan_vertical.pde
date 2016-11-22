import processing.video.*;

// Video
Capture cam;

// number of frames
final int frameNum = 180;
// current frame
int currentFrame = 0;
// Image Array
PImage[] images = new PImage[frameNum];
PImage[] slit_images = new PImage[frameNum];

int slitWidth;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(1280, 720); // ウィンドウサイズを960px,540pxに
  frameRate(30);
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  cam = new Capture(this, 1280, 720);
  cam.start();
  for (int i = 0; i < frameNum; i++) {
    images[i] = new PImage();
  }
  slitWidth = width / frameNum;
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  if(cam.available()){
    cam.read();
    images[currentFrame] = cam.get();
    currentFrame++;
    if (currentFrame > frameNum-1) {
      currentFrame = 0;
    }


  }
  int tmpFrame;

  for (int i=0; i<frameNum; i++) {
    tmpFrame = currentFrame + i + 1;
    if (tmpFrame > frameNum-1) {
      tmpFrame = tmpFrame - frameNum;
    }
    slit_images[i] = images[tmpFrame].get(i*slitWidth, 0, slitWidth, height);
  }

  for (int i=0; i<frameNum; i++) {
    image(slit_images[i], i*slitWidth, 0, slitWidth, height);
  }

}
