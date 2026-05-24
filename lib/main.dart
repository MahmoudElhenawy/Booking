import 'package:flutter/material.dart';

void main() {
  runApp(const Booking());
}

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false);
  }
}
