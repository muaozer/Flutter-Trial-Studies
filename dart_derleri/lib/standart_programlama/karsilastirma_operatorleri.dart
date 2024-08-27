void main() {
  int a = 20;
  int b = 40;

  int x = 85;
  int y = 100;

  print("a b ye eşittir : ${a == b}");
  print("a b ye eşit değildir : ${a != b}");
  print("a b den küçüktür : ${a < b}");
  print("a b den büyüktür : ${a > b}");
  print("a b den küçük eşittir : ${a <= b}");
  print("a b den büyük eşittir : ${a >= b}");

  print("a b den büyüktür veya x y den büyüktür : ${a > b || x > y}");
  print("a b den büyüktür ve x y den büyüktür : ${a > b && x > y}");
}