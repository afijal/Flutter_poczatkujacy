import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zadanie/model/conversation.dart';
import 'package:zadanie/pages/homepage.dart';
import 'package:zadanie/provider/data.dart';

const dataKey = 'data';

class DataLoadingPage extends StatefulWidget {
  DataLoadingPage({Key? key}) : super(key: key);

  @override
  _DataLoadingPageState createState() => _DataLoadingPageState();
}

class _DataLoadingPageState extends State<DataLoadingPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final serialized = prefs.getStringList(dataKey) ?? [];
    List<Conversation> deserialized = serialized.map((e) => Conversation.fromJson(jsonDecode(e))).toList();
    context.read<Data>().loadConversations(deserialized);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => Homepage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
