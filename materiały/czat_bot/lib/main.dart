import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zadanie/pages/data_loading_page.dart';
import 'package:zadanie/pages/homepage.dart';
import 'package:zadanie/provider/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (_) => Data(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DataLoadingPage(),
      ),
    );
  }
}
