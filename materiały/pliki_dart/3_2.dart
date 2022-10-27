import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Parent extends StatefulWidget {
  const Parent({Key? key}) : super(key: key);

  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  var input = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        input = input -= 1;
      }),
      child: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(20),
        child: input == -5
            ? const SizedBox.shrink()
            : Stateful(
                input: input,
              ),
      ),
    );
  }
}

class Stateful extends StatefulWidget {
  const Stateful({Key? key, required this.input}) : super(key: key);
  final int input;

  @override
  _StatefulState createState() => _StatefulState();
}

class _StatefulState extends State<Stateful> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.input;
    print("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant Stateful oldWidget) {
    super.didUpdateWidget(oldWidget);
    count = widget.input;
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    print("deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return GestureDetector(
        onTap: () => setState(() {
              print("SetState");
              count = count += 1;
            }),
        child: Text('Mam stan: $count'));
  }
}
