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
    final size = 100.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurs Flutter'),
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            color: Colors.brown.shade200,
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: size,
                  height: size,
                  color: Colors.red,
                ),
                Container(
                  width: size,
                  height: size,
                  color: Colors.yellow,
                ),
                Spacer(),
                Container(
                  width: size,
                  height: size,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          // child: Container(
          //   color: Colors.brown.shade200,
          //   child: Stack(
          //     children: [
          //       Align(
          //         alignment: Alignment.centerRight,
          //         child: Container(
          //           width: size * 2,
          //           height: size * 2,
          //           color: Colors.red,
          //         ),
          //       ),
          //       Container(
          //         width: size * 1.5,
          //         height: size * 1.5,
          //         color: Colors.yellow,
          //       ),
          //       Positioned(
          //         top: 100,
          //         left: 100,
          //         child: Container(
          //           width: size * 1.5,
          //           height: size * 1.5,
          //           color: Colors.green,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
