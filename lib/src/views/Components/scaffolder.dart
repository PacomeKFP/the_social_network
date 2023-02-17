import 'package:flutter/material.dart';

class Scaffolder extends StatelessWidget {
  final Widget content;
  const Scaffolder({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              child: content,
            )),
      ),
    );
    
  }
}
