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
      debugShowCheckedModeBanner: false,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ElegantNotification.success(
                    title: 'Update',
                    description: 'Your data has been updated',
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Success theme notification',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  ElegantNotification.error(
                    title: 'Error',
                    description: 'Please verifiy your data',
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error theme notification',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ElegantNotification.info(
                    title: 'Info',
                    description: 'This account will be updated once you exit',
                    showProgressIndicator: false,
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Info theme notification',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  ElegantNotification(
                    title: 'New version',
                    description:
                        'A new version is available to you please update.',
                    icon: Icon(
                      Icons.access_alarm,
                      color: Colors.orange,
                    ),
                    progressIndicatorColor: Colors.orange,
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Custom notification',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
