import 'package:flutter/material.dart';

class Example3_17 extends StatefulWidget {
  const Example3_17({Key? key}) : super(key: key);

  @override
  State<Example3_17> createState() => _Example3_17State();
}

class _Example3_17State extends State<Example3_17> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('3.17'),
        ),
        body: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Card(
                        elevation: 5,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(),
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Card(
                        color: Colors.amberAccent,
                        child: Container(
                          height: 150.0,
                        ),
                      )),
                    ],
                  ),
                  Wrap(
                    spacing: 5,
                    children: [
                      const Chip(
                        label: Text("Chip 1"),
                      ),
                      const Chip(
                        label: Text("Chip 2"),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text('AB'),
                        ),
                      ),
                      Chip(
                        label: const Text("Chip 3"),
                        onDeleted: () => snackbar(context, "Delete chip 3"),
                      ),
                      const Chip(
                        backgroundColor: Colors.red,
                        label: Text("Chip 4"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const CircularProgressIndicator(),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const CircularProgressIndicator(
                  //   strokeWidth: 10,
                  //   color: Colors.brown,
                  // ),
                  const Spacer(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void snackbar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class BackButtonExample extends StatelessWidget {
  const BackButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      body: const Center(child: Text('Body of other screen')),
    );
  }
}
