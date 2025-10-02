import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/providers/exercisecard_provider.dart';
import 'package:flutter_fitness_app/providers/foods_provider.dart';
import 'package:flutter_fitness_app/providers/pedometer_provider.dart';
import 'package:flutter_fitness_app/providers/stats_provider.dart';
import 'package:flutter_fitness_app/screens/calories_screen.dart';
import 'package:flutter_fitness_app/screens/home_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_fitness_app/providers/calculate_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculateProvider()),
        ChangeNotifierProvider(create: (_) => StatsProvider()),
        ChangeNotifierProvider(create: (_) => StepCounterProvider()),
        ChangeNotifierProvider(create: (_) => ExercisecardProvider()),
        ChangeNotifierProvider(create: (_) => FoodsProvider()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        ),
        home: CaloriesScreen(),
      ),
    );
  }
}
