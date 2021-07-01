import 'package:flutter/material.dart';
import 'package:message_board_app/NavigationPages/entry_page.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.amberAccent

      ),
      home: EntryPage(),
    );
  }
}