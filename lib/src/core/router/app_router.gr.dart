// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthenticationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AuthenticationPage(),
      );
    },
    PostsListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PostsListPage(),
      );
    },
    PostDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PostDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PostDetailsPage(
          key: args.key,
          color: args.color,
          post: args.post,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AuthenticationRoute.name,
          path: '/',
        ),
        RouteConfig(
          PostsListRoute.name,
          path: '/posts',
        ),
        RouteConfig(
          PostDetailsRoute.name,
          path: '/post/:id',
        ),
      ];
}

/// generated route for
/// [AuthenticationPage]
class AuthenticationRoute extends PageRouteInfo<void> {
  const AuthenticationRoute()
      : super(
          AuthenticationRoute.name,
          path: '/',
        );

  static const String name = 'AuthenticationRoute';
}

/// generated route for
/// [PostsListPage]
class PostsListRoute extends PageRouteInfo<void> {
  const PostsListRoute()
      : super(
          PostsListRoute.name,
          path: '/posts',
        );

  static const String name = 'PostsListRoute';
}

/// generated route for
/// [PostDetailsPage]
class PostDetailsRoute extends PageRouteInfo<PostDetailsRouteArgs> {
  PostDetailsRoute({
    Key? key,
    required Color color,
    required Post post,
  }) : super(
          PostDetailsRoute.name,
          path: '/post/:id',
          args: PostDetailsRouteArgs(
            key: key,
            color: color,
            post: post,
          ),
        );

  static const String name = 'PostDetailsRoute';
}

class PostDetailsRouteArgs {
  const PostDetailsRouteArgs({
    this.key,
    required this.color,
    required this.post,
  });

  final Key? key;

  final Color color;

  final Post post;

  @override
  String toString() {
    return 'PostDetailsRouteArgs{key: $key, color: $color, post: $post}';
  }
}
