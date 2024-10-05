import 'package:auth/auth.dart';
import 'package:create_todo/create_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/todo.dart';

class AppNavigator {
  static const String _authPath = '/';
  static const String _todoPath = '/todo';
  static const String _createTodoPath = '/create_todo';

  static GoRouter get appRouter => _router;

  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: _authPath,
        builder: (BuildContext context, GoRouterState state) {
          return AuthScreen();
        },
      ),
      GoRoute(
        path: _todoPath,
        builder: (BuildContext context, GoRouterState state) {
          return TodoScreen();
        },
      ),
      GoRoute(
        path: _createTodoPath,
        builder: (BuildContext context, GoRouterState state) {
          return CreateTodoScreen();
        },
      ),
    ],
  );

  static void pop<T>([T? value]) {
    _router.pop<T>(value);
  }

  static Future<T?> pushToTodoScreen<T>() async {
    return _router.push<T?>(_todoPath);
  }

  static Future<T?> pushToAuthScreen<T>() async {
    return _router.push<T?>(_authPath);
  }

  static Future<T?> pushToCreateTodoScreen<T>() async {
    return _router.push<T?>(_createTodoPath);
  }
}
