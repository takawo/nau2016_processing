/*
  プログラミングにおける計算と代入の基本
 右辺の計算結果を左辺へ代入する
 
 ■ Processingの代表的な変数の型
 int : 整数型
 float : 浮動小数点数型
 boolean : 真偽値(true/false)
 char : 文字（1文字、キャラクター）、キーボードのイベントはStringではなくこちらを使う
 String : 文字列、テキストの表示などはcharではなくこちらを使う 
 
 ■ Processingの計算記号
 + : 加算
 - : 減算
 * : 乗算
 / : 除算
 % : 剰余（余り）
 */

// 整数型(int)の変数iに100を代入
int i = 100;
println(i); // 100が出力
// 変数iに{i(=100)+200}の計算結果を代入
i = i + 200; // 参考：i += 200;というふうにも書ける
println(i);

// 浮動小数点数型(float)の変数jに3.141592を代入
float j = 3.141592;
println(j); 
j = j * 10; // 参考：j *= 10;というふうにも書ける
println(j);

// 真偽値型の変数kにtrueを代入
boolean k = true;
println(k); 
k = !k; // 変数kの値を入れ替える(falseに);
println(k);

// 文字型の変数lに'l'を代入
char l = 'l'; // charは一文字しか代入できない
println(int(l)); // lの文字コードを出力

// 文字列型の変数mに"morning"を代入
String m = "morning"; 
println(m); // mを出力