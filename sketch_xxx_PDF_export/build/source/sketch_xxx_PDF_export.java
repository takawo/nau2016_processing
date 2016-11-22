import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.pdf.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_xxx_PDF_export extends PApplet {

// PDF\u30e9\u30a4\u30d6\u30e9\u30ea\u306e\u30a4\u30f3\u30dd\u30fc\u30c8


// A4\u6a2a\u306e\u5834\u5408\u306ftrue,A4\u7e26\u306e\u5834\u5408\u306ffalse
boolean isLandScape = true;

// A4 : 210 * 0.03937 * 72 = 595
// A4 : 297 * 0.03937 * 72 = 842

// drawing variables
float grid = 30;
int frameCounter = 0;

public void setup() {
  // create window and set size (for PDF)
  settings();
  // begin PDF
  beginRecord (PDF, "Built_with_Processing.pdf");
  colorMode (HSB, 360, 100, 100, 100);
}

public void draw() {
  // see void drawPDF;
  drawPDF();
  // finish draw PDF
  endRecord();
  // finish processing app.
  exit();
}

public void settings() {
  pageSize(com.lowagie.text.PageSize.A4, isLandScape, P2D);
  //pageSize(com.lowagie.text.PageSize.A3, isLandScape, P2D);
  //pageSize(com.lowagie.text.PageSize.A2, isLandScape, P2D);
}

public void pageSize(com.lowagie.text.Rectangle r, boolean isLandscape, String renderer) {
  if (isLandscape) {
    size((int)r.getTop(), (int)r.getRight(), renderer);
  } else {
    size((int)r.getRight(), (int)r.getTop(), renderer);
  }
}

//
public void drawPDF() {
  background(203, 45, 88);
  noStroke();
  fill(345, 30, 92);
  int row_counter = frameCounter;
  for (float y = 0; y <= height; y += grid/2) {
    if (row_counter %2 == 0) {
      pushMatrix();
      translate(grid/2, 0);
    }
    for (float x = 0; x <= width; x += grid) {
      switch(row_counter %4) {
      case 0:
        pushMatrix();
        translate(x, y);
        rotate(PI/4);
        rect(0, 0, grid/3, grid/3);
        popMatrix();
        break;
      case 1:
        ellipse(x, y, grid/3, grid/3);
        break;
      case 2:
        drawTriangle(x, y, grid/3);
        break;
      case 3:
        drawCross(x, y, grid/3);
        break;
      }
    }
    if (row_counter %2 == 0) {
      popMatrix();
    }
    row_counter++;
  }
}
// triangle
public void drawTriangle(float _x, float _y, float size) {
  pushMatrix();
  translate(_x, _y);
  rotate(radians(30));
  beginShape();
  for (float angle = 0; angle < 360; angle += 360f/3f) {
    float theta = radians(angle);
    float x = cos(theta) * size/1.5f;
    float y = sin(theta) * size/1.5f;
    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}
// cross
public void drawCross(float _x, float _y, float size) {
  rectMode(CENTER);
  pushMatrix();
  translate(_x, _y);
  rotate(radians(45));
  rect(0, 0, size, size/3);
  rect(0, 0, size/3, size);
  endShape(CLOSE);
  popMatrix();
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_PDF_export" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
