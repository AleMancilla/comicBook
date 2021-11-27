import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 30, fontFamily: "Comic", fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
