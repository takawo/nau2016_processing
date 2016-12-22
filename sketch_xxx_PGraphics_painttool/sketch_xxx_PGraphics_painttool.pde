PGraphics canvas;
float num = 540; 
void setup() {
  size(960, 540);
  colorMode(HSB, 360, 100, 100);
  smooth();
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.colorMode(HSB, 360, 100, 100);
  canvas.smooth();
  canvas.endDraw();
}

void draw() {
  background(0, 0, 0);
  noStroke();
  for (float i=0; i<num; i++) {
    fill(0, 0, i*100/num);
    rect(width* i/num, 0, width/num, height);
  }
  image(canvas, 0, 0);
}

void mouseDragged() {
  if (mouseButton == LEFT) { 
    drawFunction();
  } else { 
    noFill(); 
    stroke(120, 80, 100);
    strokeWeight(3);
    ellipse(mouseX, mouseY, 50, 50); 
    eraseFunction();
  }
}

void drawFunction() {
  canvas.beginDraw();
  canvas.stroke(0, 100, 100);
  canvas.strokeWeight(15);
  canvas.line(mouseX, mouseY, pmouseX, pmouseY);
  canvas.endDraw();
}

void eraseFunction() {
  color c = color(0, 0, 0, 0);
  canvas.beginDraw();
  canvas.loadPixels();
  for (int x=0; x<canvas.width; x++) {
    for (int y=0; y<canvas.height; y++ ) {
      float distance = dist(x, y, mouseX, mouseY);
      if (distance <= 25) {
        int loc = x + y*canvas.width;
        canvas.pixels[loc] = c;
      }
    }
  }
  canvas.updatePixels();
  canvas.endDraw();
}