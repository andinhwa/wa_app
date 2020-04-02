import 'package:flutter/material.dart';
import 'package:waverley_tools/screens/auth/authenticate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'WA VN',
        theme: new ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF212121),
          accentColor: const Color(0xFF64ffda),
          canvasColor: const Color(0xFF303030),
          bottomAppBarColor: Colors.red,
        ),
        home: Authenticate());
  }
}
