import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hi Nevil,", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500)),
        Text("Welcome Back!", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600)),
      ],
    );
  }
}