import 'dart:math';

void main() {
  const valueFrom = 5.0;
  const valueTo = 7.0;
  const step = 1;
  
  print("y = 5 * x^2 - 7 * x\n");

  var x = valueFrom;
  var count = 0;
  var all = 1.0;

  do {
    final y = calc(x);
    print("x = $x, 5 * $x^2 - 7 * $x = $y");
    x += step;
    all = all * y;
    count++;
  } while (x < valueTo);

  final mean = exp(log(all) / count);
  print("\nmean = $mean");
}

double calc(double x) {
  return 5 * x * x - 7 * x;
}
