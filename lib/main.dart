import 'package:currencyobserverflutter/bottom_navigation.dart';
import 'package:currencyobserverflutter/dependency_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.blue[200]
              : null),
      home: new Bottom(),
    );
  }
}
