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
              height > 200
                  ? Container(
                      height: height,
                      padding: const EdgeInsets.fromLTRB(5, 10, 15, 20),
                      decoration: BoxDecoration(
                        color: Colors.brown.shade200,
                        border: Border.all(),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 3.0,
                            blurRadius: 10.0,
                            color: Colors.red,
                          )
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        "PRZYKŁAAAAAAAAAAAAAAAAD",
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox.shrink(),
              Spacer(),
              GestureDetector(
                onTap: () => setState(() {
                  height = height + 10;
                }),
                child: Container(
                  height: 100,
                  width: 100,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              )
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
