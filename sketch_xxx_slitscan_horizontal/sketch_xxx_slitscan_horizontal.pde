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

boolean isLineShow = false;
int slitHeight;

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
  slitHeight = height / frameNum;
}
void captureEvent(Capture cam){
  cam.read();
}
// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0,0,0);
  images[currentFrame] = cam.get();
  int tmpFrame = 0;

  for (int i=0; i<frameNum; i++) {
    tmpFrame = currentFrame + i + 1;
    if (tmpFrame > frameNum-1) {
      tmpFrame = tmpFrame - frameNum;
    }
    slit_images[i] = images[tmpFrame].get(0, i*slitHeight, width, slitHeight);
  }

  for (int i=0; i<frameNum; i++) {
    image(slit_images[i], 0, i*slitHeight, width, slitHeight);
  }

  currentFrame++;
  if (currentFrame > frameNum-1) {
    currentFrame = 0;
  }
  if(isLineShow){
    stroke(0,0,100);
    strokeWeight(5);
    line(0,(frameNum-currentFrame)*slitHeight,width,(frameNum-currentFrame)*slitHeight);
  }
}

void keyPressed(){
  if(key == ' '){
    isLineShow = !isLineShow;
  }
}
