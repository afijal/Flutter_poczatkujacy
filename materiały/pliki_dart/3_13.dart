import 'package:flutter/material.dart';

class Example3_13 extends StatefulWidget {
  const Example3_13({Key? key}) : super(key: key);

  @override
  State<Example3_13> createState() => _Example3_13State();
}

class _Example3_13State extends State<Example3_13> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          // leading: Builder(builder: (context) {
          //   return IconButton(
          //     onPressed: () => snackbar(context, "Pressed leading "),
          //     icon: const Icon(Icons.home),
          //   );
          // }),
          title: const Text('AppBar'),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () => snackbar(context, "Pressed action"),
                icon: const Icon(Icons.alarm),
              );
            })
          ],
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              children: [
                Spacer(),
                const Text('Body'),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const BackButtonExample())),
                  child: const Text('Go to other screen'),
                ),
                Spacer(),
              ],
            ),
          );
        }),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.question_answer),
            backgroundColor: Colors.pinkAccent.shade100,
            onPressed: () => snackbar(context, 'Floating action button pressed'),
          );
        }),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (_) => setState(() {
            index = _;
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
        drawer: Builder(builder: (context) {
          return Container(
            color: Colors.white,
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(title: const Text('Item 1'), onTap: () => snackbar(context, 'Item 1 pressed')),
                ListTile(title: const Text('Item 2'), onTap: () => snackbar(context, 'Item 2 pressed')),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      body: const Center(child: Text('Body of other screen')),
    );
  }
}
