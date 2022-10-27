import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Example3_14 extends StatefulWidget {
  const Example3_14({Key? key}) : super(key: key);

  @override
  State<Example3_14> createState() => _Example3_14State();
}

class _Example3_14State extends State<Example3_14> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: const CupertinoThemeData(
        primaryColor: Colors.amber,
      ),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          // leading: Builder(builder: (context) {
          //   return IconButton(
          //     onPressed: () => snackbar(context, "Pressed leading "),
          //     icon: const Icon(Icons.home),
          //   );
          // }),
          middle: const Text('AppBar'),
          trailing: CupertinoButton(
            onPressed: () => snackbar(context, "Pressed action"),
            child: const Icon(Icons.alarm),
          ),
        ),
        child: Builder(builder: (context) {
          return Center(
            child: Column(
              children: [
                Spacer(),
                const Text('Body'),
                CupertinoButton(
                  onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const BackButtonExample())),
                  child: const Text('Go to other screen'),
                ),
                Spacer(),
              ],
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
    final tabs = [
      CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('AppBar 1'),
        ),
        child: Builder(builder: (context) {
          return const Center(
            child: Text('Body 1'),
          );
        }),
      ),
      CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('AppBar 2'),
        ),
        child: Builder(builder: (context) {
          return const Center(
            child: Text('Body 2'),
          );
        }),
      ),
    ];

    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return tabs[index];
        });
  }
}
