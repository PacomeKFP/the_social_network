import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:the_social_network/src/models/models.dart';

import '../Components/scaffolder.dart';
import 'Components/CommentComponent.dart';
import 'Components/PostDetailsComponent.dart';

class PostDetailsPage extends StatelessWidget {
  final Color color;
  final Post post;
  const PostDetailsPage({super.key, required this.color, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffolder(
      title: "Commentaires",
      hPadding: 0,
      content: Column(
        children: [
          /// afficher le post
          PostDetailsComponent(
            post: post,
            color: color,
          ),

          FutureBuilder(
              future: Comment.getPostComments(post.id),
              builder: (context, snapshot) {
                return snapshot.hasData && snapshot.data!.isNotEmpty
                    ? Column(
                        children: snapshot.data!
                            .map((comment) => CommentComponent(
                                  comment: comment,
                                ))
                            .toList(),
                      )
                    : CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
