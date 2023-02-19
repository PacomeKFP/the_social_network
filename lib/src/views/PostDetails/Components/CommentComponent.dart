import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_social_network/src/models/models.dart';

class CommentComponent extends StatelessWidget {
  final Comment comment;
  const CommentComponent({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration:const BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.name,
            style: GoogleFonts.quicksand().copyWith(fontSize: 14, fontWeight:FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            comment.body,
            textAlign: TextAlign.justify,
            style: GoogleFonts.quicksand().copyWith(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Text(
            "De: ${comment.email}",
            textAlign: TextAlign.end,
            style: GoogleFonts.quicksand().copyWith(fontSize: 14, color: color),
          ),
          const Divider()
        ],
      ),
    );
  }
}
