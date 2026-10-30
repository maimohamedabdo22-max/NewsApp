import 'package:flutter/material.dart';

class CircleIcons extends StatelessWidget {
   const CircleIcons({super.key,required this.icon});
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 18,
      child: Icon(icon),
    );
  }
}
