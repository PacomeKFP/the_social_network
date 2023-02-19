import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:the_social_network/src/models/models.dart';
import 'package:the_social_network/src/views/Auth/auth.view.dart';
import 'package:the_social_network/src/views/PostDetails/post_details.view.dart';
import 'package:the_social_network/src/views/PostList/posts_list.view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: AuthenticationPage, initial: true),
    AutoRoute(page: PostsListPage, path:'/posts'),
    AutoRoute(page:PostDetailsPage, path:'/post/:id')
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
