import 'package:flutter/material.dart';
import 'package:hero_ticket_animation/pages/PlaneTicketListPage.dart';
import 'package:hero_ticket_animation/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: PlaneTicketListPage(),
    );
  }
}
