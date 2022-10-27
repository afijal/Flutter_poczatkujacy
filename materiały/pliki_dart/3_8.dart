import 'package:dough/dough.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final example = "Przykładowy tekst";

  final space = const SizedBox(
    height: 10,
  );

  var height = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurs Flutter'),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Container(
                height: 300,
                width: 300,
                color: Colors.yellow,
                child: GestureDetector(
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('on tap'),
                    ),
                  ),
                  onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('on long press'),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('on tap'),
                  ),
                ),
                onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('on long press'),
                  ),
                ),
                child: Ink(
                  height: 300,
                  width: 300,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Licznik'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                'Nacisnąłeś przycisk: $_counter razy',
              ),
            ),
            PressableDough(
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.add),
                backgroundColor: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
