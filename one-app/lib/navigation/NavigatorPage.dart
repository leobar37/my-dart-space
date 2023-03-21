import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text("go to first page"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}

class NavigatorLeoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Navigator Page"),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsetsDirectional.only(start: 50, end: 50),
            child: Center(
                child: Wrap(
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                      child: Text("go to second page"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondPage()));
                      },
                      style: ElevatedButton.styleFrom(),
                    )),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    child: Text("go to second page and remove this page"),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondPage()));
                    },
                  ),
                ),
              ],
            ))));
  }
}
