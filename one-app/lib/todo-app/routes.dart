import "package:auto_route/auto_route.dart";
import 'routes.gr.dart';

/**
 * @see https://medium.flutterdevs.com/inherited-widget-in-flutter-604b0f009297
 * 
 */

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CreateTodoRoute.page, path: "/create"),
        AutoRoute(page: ListTodoRoute.page, path: "/"),
        RedirectRoute(path: "*", redirectTo: "/")
      ];
}
