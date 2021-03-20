import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_dialog/pdialog_ee.dart';
import 'package:p_dialog_example/linear_progress.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _start = 0.0;

  PDialogEE dialog = PDialogEE(
    bgColor: Colors.pink,
    indicatorColor: Colors.lightBlue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title')),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 20),
          ProgressIndicatorDemo(),
          SizedBox(height: 20),
          MaterialButton(
              child: Text('show dialog'),
              onPressed: () {
                showPDialog(context: context, pDialogEE: dialog);
                final _timer = new Timer.periodic(
                  const Duration(seconds: 1),
                  (Timer timer) => setState(
                    () {
                      if (_start >= 1) {
                        timer.cancel();
                        if (dialog.isShowing()) {
                          dialog.onDismiss();
                        }
                        _start = 0.0;
                      } else {
                        _start += 0.1;
                        dialog.setDialogProgress(_start);
                      }
                      print(_start);
                    },
                  ),
                );
              }),
          SizedBox(height: 10),
          MaterialButton(
            child: Text('Hello'),
            onPressed: () {
              print(dialog.isShowing());
            },
          )
        ],
      )),
    );
  }
}
