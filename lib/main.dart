       import 'package:flutter/material.dart';
import 'package:hungry/root.dart';
import 'package:hungry/splash.dart';

import 'features/auth/view/login_view.dart';
import 'features/auth/view/singup_veiw.dart';

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

      home: SingupVeiw(),
    );
  }
}


