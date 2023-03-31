import 'package:flutter/material.dart';
import 'package:flutter_mvvm_movie/res/AppContextExtension.dart';
import 'package:flutter_mvvm_movie/view/details/MovieDetailsScreen.dart';
import 'package:flutter_mvvm_movie/view/home/HomeScreen.dart';

import 'models/movieslist/movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: context.resources.color.colorPrimary,
        accentColor: context.resources.color.colorAccent,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id : (context) => HomeScreen(),
        MovieDetailsScreen.id : (context) => MovieDetailsScreen(ModalRoute.of(context)!.settings.arguments as Movie),
      },
    );
  }
}