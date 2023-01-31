import 'package:flutter/material.dart';

class Dw9DeliveryApp extends StatefulWidget {
  const Dw9DeliveryApp({super.key});

  @override
  State<Dw9DeliveryApp> createState() => _Dw9DeliveryAppState();
}

class _Dw9DeliveryAppState extends State<Dw9DeliveryApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      routes: {
        '/': (context) => Container(),
      },
    );
  }
}
