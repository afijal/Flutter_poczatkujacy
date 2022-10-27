import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Example3_18 extends StatefulWidget {
  const Example3_18({Key? key}) : super(key: key);

  @override
  State<Example3_18> createState() => _Example3_18State();
}

class _Example3_18State extends State<Example3_18> {
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
          title: const Text('3.18'),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              children: [
                Spacer(),
                CupertinoButton(
                  onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => const CupertinoPage())),
                  child: const Text('CupertinoPageRoute'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MaterialPage())),
                  child: const Text('MaterialPageRoute'),
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

class MaterialPage extends StatelessWidget {
  const MaterialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material'),
      ),
      body: Center(
        child: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Back'),
        ),
      ),
    );
  }
}

class CupertinoPage extends StatelessWidget {
  const CupertinoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cupertino'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Back'),
        ),
      ),
    );
  }
}
