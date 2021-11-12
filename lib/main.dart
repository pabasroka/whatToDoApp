import 'package:flutter/material.dart';
import 'package:what_to_do/pages/home.dart';
import 'package:what_to_do/pages/activity.dart';
import 'package:what_to_do/pages/loading.dart';
import 'package:what_to_do/pages/search.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/search': (context) => Search(),
      '/activity': (context) => Activity(),
    },
  ));
}
