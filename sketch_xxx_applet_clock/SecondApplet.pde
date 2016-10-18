//Second Applet Class
//thank s! => http://3846masa.blog.jp/archives/1038375725.html

class SecondApplet extends PApplet {
  PApplet parent;
  PSurface surface;
  PFont font;
  String str="0";
  SecondApplet(PApplet _parent) {
    super();
    // set parent
    this.parent = _parent;
    //// init window
    try {
      java.lang.reflect.Method handleSettingsMethod =
        this.getClass().getSuperclass().getDeclaredMethod("handleSettings", null);
      handleSettingsMethod.setAccessible(true);
      handleSettingsMethod.invoke(this, null);
    } 
    catch (Exception ex) {
      //ex.printStackTrace();
    }

    surface = super.initSurface();
    surface.placeWindow(new int[]{0, 0}, new int[]{0, 0});
    surface.setAlwaysOnTop(true);
    this.showSurface();
    this.startSurface();
  }

  void settings() {
    size(200, 400);
  }
  void setTitle(String str) {
    surface.setTitle(str);
  }

  void setup() {
    colorMode(HSB, 360, 100, 100);
    textAlign(CENTER, CENTER);
    textFont(font);
    textSize(250);
  }

  void draw() {
    background(frameCount % 360, 80, 100);
    noStroke();
    fill(0, 0, 100);
    text(str, 100, 200);
  }
}