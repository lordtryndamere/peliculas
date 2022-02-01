import 'package:flutter/material.dart';
import 'package:peliculas/screens/screen.dart';
import 'package:peliculas/themes/app_theme.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      theme:AppTheme.lighTheme ,
      routes: {
        'home':(__) => HomeScreen(),
        'detail':(__) => DetailsScreen()
      },

    );
  }
}