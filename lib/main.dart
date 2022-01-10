import 'package:flutter/material.dart';
import 'package:world_time/page/Home_screen.dart';
import 'package:world_time/page/loading.dart';
import 'package:world_time/page/location_choose.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => loading(),
      '/home': (context) => Home(),
      '/location': (context) => location(),
    },
  ));
}
