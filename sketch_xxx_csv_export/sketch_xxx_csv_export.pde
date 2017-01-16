PrintWriter output;
int num = 360;
String filename = nf(year(), 2) + nf(month(), 2) + nf(day(), 2) +"-"+ nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + "-" + num;
output = createWriter( filename + ".csv");

for (int i = 0; i < num; i++) {
  float value = random(100);
  output.println(i + "," + value);
}
output.flush();
output.close();
exit();
