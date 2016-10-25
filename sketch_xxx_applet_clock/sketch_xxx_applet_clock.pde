SecondApplet[] seconds = new SecondApplet[8];

int year, month, day;
int hour, minute, second;
String yearStr, monthStr, dayStr;
String hourStr, minuteStr, secondStr;
String timeStr;
String[] timeArray = new String[8];
PFont font;

void settings(){
  fullScreen(0);
}

void setup() {
  settings();
  timeInit();
  font = loadFont("DIN-250.vlw");
  for (int i = 0; i < seconds.length; i++) {
    seconds[i]= new SecondApplet(this);
    seconds[i].font = font;
    float y = (displayHeight/2 - 200) + sin(radians(frameCount%360+i*360/seconds.length))*displayHeight/5;
    seconds[i].str = timeArray[i];
    seconds[i].surface.setLocation(i*150+50, int(y));
  }
}

void draw() {
  timeInit();
  for (int i = 0; i < seconds.length; i++) {
    float y = (displayHeight/2 - 200) + sin(radians(frameCount%360+i*360/seconds.length))*displayHeight/5;
    seconds[i].setTitle(timeArray[i]);
    seconds[i].str = timeArray[i];
    seconds[i].surface.setLocation(i*150+50, int(y));
    if(i == 0){
        //surface.setLocation(i*200+50+50, int(y)+50);
    }
  }
}

void timeInit() {
  year = year();
  month = month();
  day = day();

  hour = 100 + hour();
  minute = 100 + minute();
  second = 100 + second();

  hourStr = (String)Integer.toString(hour).substring(1);
  minuteStr = (String)Integer.toString(minute).substring(1);
  secondStr = (String)Integer.toString(second).substring(1);

  timeStr = hourStr + ":" + minuteStr + ":" + secondStr;
  for (int i = 0; i < timeStr.length(); i++) {
    timeArray[i] = Character.toString(timeStr.charAt(i));
  }
}