import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Example3_16 extends StatefulWidget {
  const Example3_16({Key? key}) : super(key: key);

  @override
  State<Example3_16> createState() => _Example3_16State();
}

class _Example3_16State extends State<Example3_16> {
  bool cupertino = false;
  bool material = false;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
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
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      const Text('Material switch'),
                      Switch(
                        value: material,
                        onChanged: (_) => setState(() {
                          material = !material;
                        }),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      const Text('Material switch'),
                      CupertinoSwitch(
                        value: cupertino,
                        onChanged: (_) => setState(() {
                          cupertino = !cupertino;
                        }),
                      ),
                      const Spacer(),
                    ],
                  ),
                  TextButton(
                      child: const Text('Material DatePicker default'),
                      onPressed: () => showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate: now.subtract(Duration(days: 5)),
                              lastDate: now.add(Duration(days: 5)))
                          .then((value) => snackbar(context, value.toString()))),
                  TextButton(
                      child: const Text('Material DatePicker Initital year'),
                      onPressed: () => showDatePicker(
                              initialDatePickerMode: DatePickerMode.year,
                              context: context,
                              initialDate: now,
                              firstDate: now.subtract(const Duration(days: 5)),
                              lastDate: now.add(const Duration(days: 5)))
                          .then((value) => snackbar(context, value.toString()))),
                  TextButton(
                      child: const Text('Material DatePicker Input only'),
                      onPressed: () => showDatePicker(
                              initialEntryMode: DatePickerEntryMode.inputOnly,
                              context: context,
                              initialDate: now,
                              firstDate: now.subtract(const Duration(days: 5)),
                              lastDate: now.add(const Duration(days: 5)))
                          .then((value) => snackbar(context, value.toString()))),
                  TextButton(
                      child: const Text('Material DateRangePicker'),
                      onPressed: () => showDateRangePicker(
                              context: context,
                              initialDateRange: DateTimeRange(start: now.subtract(const Duration(days: 2)), end: now),
                              firstDate: now.subtract(const Duration(days: 5)),
                              lastDate: now.add(const Duration(days: 5)))
                          .then((value) => snackbar(context, value.toString()))),
                  TextButton(
                      child: const Text('Material TimePicker'),
                      onPressed: () => showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(now))
                          .then((value) => snackbar(context, value.toString()))),
                  TextButton(
                      child: const Text('Cupertino DatePicker'),
                      onPressed: () => showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: Colors.white,
                              height: 300.0,
                              child: CupertinoDatePicker(
                                onDateTimeChanged: (DateTime value) {
                                  print(value);
                                },
                              ),
                            );
                          })),
                  TextButton(
                      child: const Text('Cupertino TimerPicker'),
                      onPressed: () => showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: Colors.white,
                              height: 300.0,
                              child: CupertinoTimerPicker(
                                onTimerDurationChanged: (Duration value) {
                                  print(value);
                                },
                              ),
                            );
                          })),
                  const SizedBox(width: 200, child: TextField()),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(width: 200, child: CupertinoTextField()),
                  const Spacer(),
                ],
              ),
            );
          })),
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
