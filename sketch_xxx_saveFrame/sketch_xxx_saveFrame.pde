int i = 0;
int offset = 30;
void setup() {
  size(960, 540);
}

void draw()
{
  background(255);
  fill(0);

  textSize(400);
  textAlign(CENTER, CENTER);

  if (frameCount < 60) {
    text(str(frameCount), 0, 0, width, height-offset);
    saveFrame(sketchPath() + "/data/text####.png");
  }else{
    exit();
  }
}
