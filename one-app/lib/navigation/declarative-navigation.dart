import 'package:flutter/material.dart';

dynamic noop() {}

/**
 * @see https://blog.logrocket.com/understanding-flutter-navigation-routing/
 */

// second page
class SecondPage extends StatelessWidget {
  final void Function() onButtonPressed;
  const SecondPage({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("go to first page"), onPressed: this.onButtonPressed),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final void Function() onButtonPressed;
  const MainPage({this.onButtonPressed = noop, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Main Page")),
        body: Center(
            child: ElevatedButton(
                child: Text("second page"),
                onPressed: () {
                  print("button presed");
                  this.onButtonPressed();
                })));
  }
}

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  List<Page> _pages = [];

  @override
  void initState() {
    super.initState();
    var secondPage = MaterialPage(child: SecondPage(
      onButtonPressed: () {
        _pages.removeLast();
        setState(() {
          _pages = _pages.toList();
        });
      },
    ));

    var mainPage = MaterialPage(child: MainPage(
      onButtonPressed: () {
        _pages.add(secondPage);
        setState(() {
          _pages = _pages.toList();
        });
      },
    ));
    _pages.add(mainPage);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Navigator(
      /**
        * onPopPage is called when OS-based navigation
        * is performed, such as pressing the back button in
        * Android or the back swipe in iOS.
        */
      onPopPage: (route, result) {
        if (route.didPop(result)) {
          _pages.removeLast();
          return true;
        }
        return false;
      },
      pages: _pages,
    ));
  }
}
