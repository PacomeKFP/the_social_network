import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_social_network/src/models/models.dart';

extension on String {
  String capitalize() =>
      this[0].toUpperCase() + this.substring(1).toLowerCase();
  
}

class PostDetailsComponent extends StatelessWidget {
  final Color color;
  final Post post;
  const PostDetailsComponent(
      {super.key, required this.color, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          post.title.capitalize()..trim(),
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Container(
          color: color,
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  post.body.replaceAll('\n', ' ').capitalize(),
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.quicksandTextTheme().titleLarge,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
