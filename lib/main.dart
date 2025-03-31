import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spesh_app/provider/home_provider.dart';
import 'package:spesh_app/screens/home_page.dart';
import 'package:spesh_app/screens/page1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
