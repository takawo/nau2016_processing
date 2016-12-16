import megamu.mesh.*;

void setup() {
  size(960, 540);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  float[][] points = new float[3][2];

  points[0][0] = random(width); // first point, x
  points[0][1] = random(height); // first point, y
  points[1][0] = random(width); // second point, x
  points[1][1] = random(height); // second point, y
  points[2][0] = random(width); // third point, x
  points[2][1] = random(height); // third point, y

  Voronoi myVoronoi = new Voronoi( points );

  MPolygon[] myRegions = myVoronoi.getRegions();

  for (int i=0; i<myRegions.length; i++){
    // an array of points
    float[][] regionCoordinates = myRegions[i].getCoords();

    fill(random(360), 80, 100);
    strokeWeight(3);
    myRegions[i].draw(this); // draw this shape
  }
  for(int i = 0; i < points.length; i++){
    float x = points[i][0];
    float y = points[i][1];
    stroke(0,0,0);
    strokeWeight(15);
    point(x,y);
  }
  noLoop();
}

void mousePressed(){
  redraw();
}
