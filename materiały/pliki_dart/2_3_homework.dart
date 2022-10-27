import 'dart:math';

void main() async {
  final input = 'Artur';
//   print(input);
//   print(reverse1(input));
//   print(reverse2(input));
//   print(reverse3(input));

//   print(input.vowels);

  print(1.isPrime);
  print(5.isPrime);
  print(23.isPrime);
  print(24.isPrime);
  print(125.isPrime);
  print(223456654.isPrime);
}

//Odwracanie stringa
String reverse1(String input) {
  var resultList = [];
  for (int i = input.length - 1; i >= 0; i--) {
    resultList.add(input[i]);
  }
  return resultList.join('');
}

String reverse2(String s) {
  return String.fromCharCodes(s.codeUnits.reversed);
}

String reverse3(String s) {
  return s.split('').reversed.join('');
}

//Samogłoski
extension VowelExtensions on String {
  List<String> get vowels {
    const vowels = ['A', 'a', 'Ą', 'ą', 'E', 'e', 'Ę', 'ę', 'I', 'i', 'O', 'o', 'U', 'u', 'Y', 'y'];
    return split('').where((c) => vowels.contains(c)).toList();
  }
}

//Liczba pierwsza
extension PrimeExtensions on int {
  bool get isPrime {
    if (this <= 1) return false;
    if (this == 2) return true;
    if (this % 2 == 0) return false;

    var boundary = sqrt(this);

    for (int i = 3; i <= boundary; i += 2) {
      if (this % i == 0) {
        return false;
      }
    }

    return true;
  }
}
