boolean saveFontNames = true;

// setup関数 : 初回1度だけ実行される
void setup(){
  // size(960,540); // ウィンドウサイズを960px,540pxに
  // colorMode(HSB,360,100,100); // HSBでの色指定にする
  // smooth(); // 描画を滑らかに
  if(saveFontNames){
    selectOutput("select output folder and filename","availableFonts");
  }else{
    printArray(PFont.list());
    exit();
  }
}

void availableFonts(File selection){
  if(selection == null){
    println("window was closed or the user hit cancel.");
  }else{
    saveStrings(selection.getAbsolutePath(),PFont.list());
    println("save done.");
  }
}


// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  noLoop();
}
