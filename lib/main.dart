import 'package:flutter/material.dart';
import 'package:todo/MyTheme.dart';
import 'package:todo/home_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        home_screen.routeName:(context) => home_screen()
      },
      initialRoute:home_screen.routeName ,
      darkTheme: MyTheme.dark_theme,
      theme: MyTheme.light_theme,
      debugShowCheckedModeBanner: false,
    );
  }

}