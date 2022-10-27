import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Example3_15 extends StatefulWidget {
  const Example3_15({Key? key}) : super(key: key);

  @override
  State<Example3_15> createState() => _Example3_15State();
}

class _Example3_15State extends State<Example3_15> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text('Burgery'),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.shopping_bag),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/download.jpeg',
                          fit: BoxFit.fitWidth,
                          width: 500,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16),
                          //height: 300,

                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () => snackbar(context, 'Added to basket'),
                                child: const Text('Add  +'),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(
                                    context, MaterialPageRoute(builder: (_) => const BackButtonExample())),
                                child: const Text('Alergens'),
                              ),
                              Spacer(),
                              Ink(
                                width: 24,
                                height: 24,
                                decoration: const ShapeDecoration(
                                  color: Colors.grey,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  splashRadius: 12,
                                  iconSize: 12,
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.star),
                                  color: Colors.white,
                                  onPressed: () {
                                    snackbar(context, 'TODO: add to favourites');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        children: [
                          const Text("Sum: 100 \$"),
                          const Spacer(),
                          OutlinedButton(
                              child: const Text("Checkout"), onPressed: () => snackbar(context, 'TODO: checkout'))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
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

class BackButtonExample extends StatefulWidget {
  const BackButtonExample({Key? key}) : super(key: key);

  @override
  State<BackButtonExample> createState() => _BackButtonExampleState();
}

class _BackButtonExampleState extends State<BackButtonExample> {
  var selectedItem;

  @override
  Widget build(BuildContext context) {
    final options = ['Option 1', 'Option 2', 'Option 3'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              DropdownButton(
                value: selectedItem,
                items: options
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (_) => setState(() {
                  selectedItem = _.toString();
                }),
              ),
              const Spacer(),
              PopupMenuButton<String>(
                itemBuilder: (_) => options.map((e) => PopupMenuItem<String>(value: e, child: Text(e))).toList(),
                onSelected: (_) => snackbar(context, _),
              ),
              const Spacer(),
            ],
          ),
          Spacer(),
          Column(
            children: [
              CupertinoButton(
                child: const Text("Button 1"),
                onPressed: () => snackbar(context, 'Button 1'),
                color: Colors.pink,
              ),
              CupertinoButton(
                child: const Text("Button 2"),
                onPressed: () => snackbar(context, 'Button 2'),
              ),
              CupertinoButton(
                child: const Icon(Icons.shopping_bag_rounded),
                onPressed: () => snackbar(context, 'Icon Button'),
              ),
              const CupertinoButton(
                child: Text("Button 4"),
                onPressed: null,
              ),
              const CupertinoButton(
                color: Colors.pink,
                child: Text("Button 5"),
                onPressed: null,
              ),
            ],
          ),
          const Spacer(),
        ],
      )),
    );
  }

  void snackbar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
