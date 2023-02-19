import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class Scaffolder extends StatelessWidget {
  final Widget content;
  final String? title;
  final double hPadding;
  const Scaffolder({super.key, required this.content, this.hPadding = 10, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:title != null ? AppBar(
        title: Text(title!),
        leading: AutoLeadingButton(),
      ) : null,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 10),
          child: SingleChildScrollView(
            child: content,
          ),
        ),
      ),
    );
  }
}
