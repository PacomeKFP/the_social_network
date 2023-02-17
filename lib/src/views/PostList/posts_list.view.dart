import 'package:flutter/material.dart';

import '../Components/scaffolder.dart';

class PostsListPage extends StatelessWidget {
  const PostsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffolder(
      content: Column(
        children: [
          Text('Les posts disponibles',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black)),
        ],
      ),
    );
  }
}
