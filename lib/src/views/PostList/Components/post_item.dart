import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:the_social_network/src/core/configs/constants.dart';
import 'package:the_social_network/src/core/router/app_router.dart';
import 'package:the_social_network/src/models/models.dart';

class PostItem extends StatefulWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = List.generate(
        2,
        (index) => Color.fromARGB(
            Random().nextInt(155) + 100,
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255))).toList();

    Color color = Constants.usersColorSwatch[widget.post.userId];
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(_controller.value * 60, _controller.value * 60),
          child: child,
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: color.withOpacity(0.4),
            borderRadius: BorderRadius.circular(60)),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: InkWell(
          onTap: () => context.router
              .push(PostDetailsRoute(post: widget.post, color: color)),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.people,
                color: color,
              ),
            ),
            title: Text(
              widget.post.title,
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              widget.post.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            isThreeLine: true,
          ),
        ),
      ),
    );
  }
}
