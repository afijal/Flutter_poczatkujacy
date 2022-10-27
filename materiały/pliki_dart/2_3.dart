void main() async {
  //////////////////////____INTRO____///////////////////////
  String name = 'Artur';
  var same = 'Artur';
  print('Type inference: ${name.runtimeType == same.runtimeType}');

  String nonNullable = 'asd';
  //nonNullable = null;
  String? nullable = 'asd';
  nullable = null;

  int a = 1;
  double b = 1.0;
  String c = '1';
  List<int> d = [1, 1];
  Set<int> e = Set.from([1, 2]);
  Map<String, int> f = Map.fromEntries([MapEntry('1', 1)]);
  //Runes i Symbol nigdy nie używałem więc ty
  //na poziomie początkującym też nie będziesz musiał

  {
    var _private = 'asdf';
  }
  //print(_private);

  late String maybeLater;
  //print(maybeLater);
  maybeLater = 'ok';
  print(maybeLater);

  //////////////////////____ASYNC____///////////////////////
  print("\n\n");
  Future<void> someAsyncFunction() async {
    return Future.delayed(Duration(seconds: 1)).then((_) => print("done"));
  }

  print("\n\n");
  print("before someAsyncFunction");
  someAsyncFunction();
  print("after calling someAsyncFunction\n");

  await Future.delayed(Duration(seconds: 2));

  print("before someAsyncFunction");
  await someAsyncFunction();
  print("after calling someAsyncFunction");

  //////////////////////____TRY CATCH____///////////////////////
  print("\n\n");
  void throwException() {
    throw Exception("BOOOM");
  }

  try {
    print("start");
    throwException();
    print("after");
  } on Exception catch (_) {
    print(_);
  } finally {
    print("end");
  }

  //////////////////////____OOP____///////////////////////
  //var soul = Soul();
  Human().askIfHasSoul();
  Devil().askIfHasSoul();
  Artur().askIfHasSoul();
  Artur().sayHello();
  //Human2().askIfHasSoul();
  ArturClone().askIfHasSoul();
  ArturClone().sayHello();

  //////////////////////____FUNCTIONS____///////////////////////
  print("\n\n");
  int giveMeFive() => 5;
  int giveMeFiveV2() {
    return 5;
  }

  String say(String from, String msg, [String? device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }

  print(say('Artur', 'Hi!'));
  print(say('Artur', 'Hi!', 'Chrome\n'));

  String say2(String from, String msg, {String? device}) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }

  print(say2('Dawid', 'Hi!'));
  print(say2('Dawid', 'Hi!', device: 'Safari\n'));

  //////////////////////____REST____///////////////////////
  print('Grzegorz'.isLong);
  print('Włodzimierz'.isLong);

  var me = KindPerson(name: 'artur', sayHi: () => 'Hi!');
  print(me.sayHi());
}

abstract class Soul {
  void askIfHasSoul() {
    print('I do have a soul');
  }
}

class Human extends Soul {}

class Devil extends Soul {
  @override
  void askIfHasSoul() {
    print('I do NOT have a soul');
  }
}

class Artur implements Soul, Devil, IntroduceYourself {
  @override
  void askIfHasSoul() {
    print('I might have a soul');
  }

  @override
  void sayHello() {
    print('My name is Artur');
  }
}

abstract class IntroduceYourself {
  void sayHello();
}

class ArturClone with Artur {}

enum Color { red, blue, green }

extension StringExtensions on String {
  bool get isLong => length > 10;
}

typedef SayHi = String Function();

class KindPerson {
  final String name;
  final SayHi sayHi;

  KindPerson({required this.name, required this.sayHi});
}
