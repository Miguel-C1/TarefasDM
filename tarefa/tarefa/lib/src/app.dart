import 'package:flutter/material.dart';
import 'screen/client_list.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ClientListScreen(),
    );
  }
}