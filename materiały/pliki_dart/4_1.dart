import 'dart:math';

import 'package:flutter/material.dart';

class Example4_1 extends StatefulWidget {
  const Example4_1({Key? key}) : super(key: key);

  @override
  State<Example4_1> createState() => _Example4_1State();
}

class _Example4_1State extends State<Example4_1> {
  @override
  Widget build(BuildContext context) {
    Widget box() => SizedBox.square(
          dimension: 100,
          child: Container(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
        );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Keys'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 1000) {
            return Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Wrap(
                      children: [
                        box(),
                        box(),
                        box(),
                        box(),
                        box(),
                        box(),
                        box(),
                        box(),
                      ],
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("AAAAAAAAAAAEEEEEEEEEEEEAAAAAAAAAAOOOooOOOoOOoOOOoOO"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("AAAAAAAAAAAEEEEEEEEEEEEAAAAAAAAAAOOOooOOOoOOoOOOoOO"),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: TextField(),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            );
          } else {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        box(),
                        box(),
                        box(),
                        box(),
                        box(),
                        box(),
                        box(),
                        box(),
                      ],
                    ),
                    box(),
                    box(),
                    Row(
                      children: [
                        Expanded(
                          child: Text("AAAAAAAAAAAEEEEEEEEEEEEAAAAAAAAAAOOOooOOOoOOoOOOoOO"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("AAAAAAAAAAAEEEEEEEEEEEEAAAAAAAAAAOOOooOOOoOOoOOOoOO"),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: TextField(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  void snackbar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
