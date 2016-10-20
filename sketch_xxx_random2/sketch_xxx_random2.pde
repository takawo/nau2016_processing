// 変数
int col = 20; // 列の数
int[] nums = new int[col]; // 列の数分の配列
int colWidth;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100);
  colWidth = width/col; // バーの幅 = 画面幅/列数
  // 配列の個数分forループ
  for (int i = 0; i < nums.length; i++) {
    nums[i] = 0; //配列の各要素の初期化
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 95);
  // ランダムで選んだ数値の配列の値を加算
  //列の数(0〜20)で、ランダムに数字を選ぶ(数字が小さい方に偏りあり)
  int r = int(random(1)*random(1)*col);

  // 大きい数字が出現しやすいようにするには
  // int r = int((1 - random(1)*random(1))*col);

  nums[r] += 5; //該当列にあたる配列の数値5を+する。

  // 各列の矩形を描画
  for (int i = 0; i < nums.length; i++) {
    float x = i*colWidth; // 開始点のx座標
    float y = height-nums[i]; // 開始点のy座標
    float w = colWidth; //列の幅
    float h = nums[i]; // 列の高さ=配列の値

    // 列の高さに応じて、矩形の塗りつぶし色の彩度を増減
    fill(0, map(h, 0, height, 0, 100), 100);
    rect(x, y, w, h); //配列の個数分、四角を描画
  }
}
