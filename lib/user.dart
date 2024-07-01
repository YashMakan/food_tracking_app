import 'package:flutter/material.dart';
import 'package:food_tracking_app/screens/order_tracking_screen.dart';
import 'package:food_tracking_app/utils/constants.dart';
import 'package:food_tracking_app/utils/dependencies.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OrderTrackingScreen(order: order),
    );
  }
}
