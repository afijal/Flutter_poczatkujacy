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
    final size = 400.0;
    final colors = [
      Colors.red,
      Colors.yellow,
      Colors.green,
    ];
    final colors2 = [
      Colors.red,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.pink,
      Colors.brown,
      Colors.black54,
      Colors.tealAccent,
      Colors.cyan,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurs Flutter'),
      ),
      body: Center(
        child: SafeArea(
            child: Container(
          color: Colors.pink.shade200,
          // child: ListView(
          //   children: colors
          //       .map((e) => Container(
          //             height: size,
          //             width: size,
          //             color: e,
          //           ))
          //       .toList(),
          // ),
          // child: ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   itemCount: colors.length,
          //   itemBuilder: (context, index) => Container(
          //     height: size,
          //     width: size,
          //     color: colors[index],
          //   ),
          // ),
          // child: ListView.separated(
          //   itemCount: colors.length,
          //   itemBuilder: (context, index) => Container(
          //     height: size,
          //     width: size,
          //     color: colors[index],
          //   ),
          //   separatorBuilder: (context, index) => const Divider(
          //     height: 10.0,
          //     thickness: 10.0,
          //     color: Colors.cyan,
          //   ),
          // ),
          // child: SingleChildScrollView(
          //   child: Container(
          //     height: 2000,
          //     decoration: const BoxDecoration(
          //         gradient: LinearGradient(
          //       begin: Alignment.topRight,
          //       end: Alignment.bottomLeft,
          //       colors: [
          //         Colors.blue,
          //         Colors.red,
          //       ],
          //     )),
          //   ),
          // ),
          // child: GridView.count(
          //   crossAxisCount: 2,
          //   scrollDirection: Axis.horizontal,
          //   children: colors2
          //       .map((e) => Container(
          //             height: size,
          //             width: size,
          //             color: e,
          //           ))
          //       .toList(),
          // ),
          child: GridView.extent(
            maxCrossAxisExtent: 400,
            children: colors2
                .map((e) => Container(
                      height: size,
                      width: size,
                      color: e,
                    ))
                .toList(),
          ),
          // child: GridView.builder(
          //   itemCount: colors2.length,
          //   itemBuilder: (context, index) => Container(
          //     height: size,
          //     width: size,
          //     color: colors2[index],
          //   ),
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          // ),
        )),
      ),
    );
  }
}
