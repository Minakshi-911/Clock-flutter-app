import 'package:clockapp/enums.dart';
import 'package:clockapp/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'homepage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock App',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) => MenuInfo(MenuType.clock),
        child: MyHomePage(),
        ),
    );
  }
}
