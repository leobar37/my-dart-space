// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:dart/todo-app/screens/CreateTodo.dart' as _i1;
import 'package:dart/todo-app/screens/LisTodo.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CreateTodoRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CreateTodoScreen(),
      );
    },
    ListTodoRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ListTodoScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateTodoScreen]
class CreateTodoRoute extends _i3.PageRouteInfo<void> {
  const CreateTodoRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CreateTodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTodoRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ListTodoScreen]
class ListTodoRoute extends _i3.PageRouteInfo<void> {
  const ListTodoRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ListTodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListTodoRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
