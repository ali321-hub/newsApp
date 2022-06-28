import 'package:appcent_news_app/locotor/locotor.dart';
import 'package:appcent_news_app/views/news/layouts/news_main_page.dart';
import 'package:flutter/material.dart';

void main() {
  setUplocotor();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NewsMainPage());
  }
}
