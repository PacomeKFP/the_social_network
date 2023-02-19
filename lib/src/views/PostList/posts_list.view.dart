import 'package:flutter/material.dart';
import 'package:the_social_network/src/models/models.dart';
import 'package:the_social_network/src/views/PostList/Components/post_item.dart';

import '../Components/scaffolder.dart';

class PostsListPage extends StatelessWidget {
  const PostsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffolder(
      title: "Les Posts",
      content: Column(
        children: [
          Text('Voici quelques posts de differents utilisateurs',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black)),
          FutureBuilder(
            future: Post.getAllPosts(),
            builder: (context, snapshot) {
              Widget child = Text(
                  'Une erreur es survenue, verifiez votre connexion internet');
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  child = CircularProgressIndicator();
                  continue display;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return const Text(
                        'Une erreur es survenue, verifiez votre connexion internet');
                  }
                  child = Column(
                    children: snapshot.data!
                        .map((post) => PostItem(post: post))
                        .toList()
                      ..shuffle(),
                  );
                  continue display;
                display:
                default:
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: child,
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
