       import 'package:flutter/material.dart';
import 'package:hungry/root.dart';
import 'package:hungry/splash.dart';


import 'features/card/view/card_view.dart';
import 'features/checkout/view/chechout_view.dart';
import 'features/login/view/login_view.dart';
import 'features/login/view/singup_veiw.dart';
import 'features/prodact/view/prodact_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Root(),

    );
  }
}


