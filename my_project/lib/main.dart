import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:usedev_uninassau_keven/src/screens/initial_screens.dart';
=======
import 'package:usedev_uninassau/src/screens/initial_screens.dart';
>>>>>>> 7aa0efc8ec4ab86d3bb63d1d51bb5530b3842920

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UseDev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
<<<<<<< HEAD
      home: const InitialScreen(),
=======
      home: InitialScreen(),
>>>>>>> 7aa0efc8ec4ab86d3bb63d1d51bb5530b3842920
    );
  }
}
