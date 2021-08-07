import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';

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
      home: Scaffold(
        body: ExampleApp(),
      ),
    );
  }
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          child: Text("Open notification"),
          onPressed: () {
            ElegantNotification.error(
                    title: "Great success!",
                    description: "Your settings have been updated and nbow you can check them")
                .show(context);
          },
        ),
      ),
    );
  }
}
