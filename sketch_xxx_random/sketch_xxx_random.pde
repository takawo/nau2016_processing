// 変数
int col = 20; // 列の数
int[] nums = new int[col]; // 列の数分の配列
int colWidth;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colWidth = width/col;
  // 配列の個数分forループ
  for (int i = 0; i < nums.length; i++) {
    nums[i] = 0; //配列の各要素の初期化
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {

  // ランダムで選んだ数値の配列の値を加算
  int r = int(random(col)); //列の数(0〜20)で、ランダムに数字を選ぶ
  nums[r] += 5; //該当列にあたる配列の数値5を+する。

  // 各列の矩形を描画
  for (int i = 0; i < nums.length; i++) {
    float x = i*colWidth; // 開始点のx座標
    float y = height-nums[i]; // 開始点のy座標
    float w = colWidth; //列の幅
    float h = nums[i]; // 列の高さ=配列の値
    rect(x, y, w, h);
  }
}