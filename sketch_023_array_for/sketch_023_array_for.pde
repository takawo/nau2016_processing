int n = 20;

// int型の配列numArray(要素数: n):
int[] numArray = new int[n];

/*
   // forループ（繰り返し処理） //
   int i = 0; // 1.初期値
   i < n; // 2.条件（if文と同じ）
   i += 1; // 3.条件がtrueのとき、{}の実行後の処理
   {}の中身は条件を満たしたとき実行される
*/

for(int i = 0; i < n; i += 1){
  numArray[i] = i*5;
  println(i);
}

// 区切り文字の出力
println("-----------------");

// 配列の要素の出力
printArray(numArray);

// 区切り文字の出力
println("-----------------");

// 拡張for文（発展版）
// こんな風に要素に処理をしていくこともできる
// for(int i : numArray){
//   println(i);
// }
