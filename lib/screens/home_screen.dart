import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fitness_app/util/head_widgets.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF232526), Color(0xFF232526), Color(0xFF414345)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Head(),
      ),
    );
  }
}

