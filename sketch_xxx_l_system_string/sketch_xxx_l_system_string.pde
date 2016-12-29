import java.util.Map;

// 最初の値
String sentense = "A";
// ハッシュマップ（ルール）
HashMap<String, String> rule = new HashMap<String, String>();
int depth = 0;
// setup関数 : 初回1度だけ実行される
void setup() {
  // ルール1: keyが"A"の時、valueとして"AB"を返す
  rule.put("A", "AB");
  // ルール2: keyが"B"の時、valueとして"B"を返す
  rule.put("B", "A");
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  println(sentense);
}

void mousePressed() {
  l_system();
}

void l_system() {
  String newSentense = "";
  for (int i = 0; i < sentense.length(); i++) {
    String c = str(sentense.charAt(i));
    //拡張for文（for-each)でループ
    for (Map.Entry<String, String> e : rule.entrySet()) {
      if (c.equals(e.getKey())) {
        newSentense += e.getValue();
      }
    }
  }
  sentense = newSentense;
  depth++;
  //println(depth,sentense);
}