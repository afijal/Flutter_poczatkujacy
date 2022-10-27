import 'package:flutter/material.dart';

class Example3_20 extends StatefulWidget {
  const Example3_20({Key? key}) : super(key: key);

  @override
  State<Example3_20> createState() => _Example3_20State();
}

class _Example3_20State extends State<Example3_20> {
  var itemsData = [
    ExampleData(id: '1', label: 'one'),
    ExampleData(id: '1', label: 'two'),
  ];
  var items = <Widget>[];

  @override
  void initState() {
    super.initState();
    items = itemsData
        .map((e) => StatefulExample(
              key: UniqueKey(),
            ))
        .toList();
  }

  void shuffle() {
    var mixed = [items[1], items[0]];
    setState(() {
      items = mixed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Keys'),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: ListView(
              children: items,
            ),
          );
        }),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.shuffle),
            backgroundColor: Colors.pinkAccent.shade100,
            onPressed: shuffle,
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

class StatefulExample extends StatefulWidget {
  const StatefulExample({Key? key}) : super(key: key);

  @override
  State<StatefulExample> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  final state = DateTime.now().microsecondsSinceEpoch & 2 == 0 ? Colors.red : Colors.green;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: state,
      height: 100,
      width: 100,
    );
  }
}

class ExampleData {
  final String label;
  final String id;

  ExampleData({required this.label, required this.id});
}
