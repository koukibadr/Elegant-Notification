// ignore_for_file: avoid_print

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

// ignore: must_be_immutable
class ExampleApp extends StatelessWidget {
  ExampleApp({super.key});

  ElegantNotification? notification;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ElegantNotification.success(
                    width: 360,
                    isDismissable: false,
                    stackedOptions: StackedOptions(
                      key: 'top',
                      type: StackedType.same,
                      itemOffset: const Offset(-5, -5),
                    ),
                    title: const Text('Update'),
                    description: const Text('Your data has been updated'),
                    onDismiss: () {
                      //Message when the notification is dismissed
                    },
                    onNotificationPressed: () {
                      //Message when the notification is pressed
                    },
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Success theme notification stacked\n(top center)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  ElegantNotification.error(
                    width: 360,
                    stackedOptions: StackedOptions(
                      key: 'topRight',
                      type: StackedType.below,
                      itemOffset: const Offset(0, 5),
                    ),
                    position: Alignment.topRight,
                    animation: AnimationType.fromRight,
                    title: const Text('Error'),
                    description: const Text('Error example notification'),
                    onDismiss: () {},
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Error theme notification\n(top right)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  notification = ElegantNotification.info(
                    width: 360,
                    stackedOptions: StackedOptions(
                      key: 'left',
                      type: StackedType.same,
                      scaleFactor: 0.2,
                      itemOffset: const Offset(-20, 10),
                    ),
                    toastDuration: const Duration(seconds: 5),
                    position: Alignment.centerLeft,
                    animation: AnimationType.fromLeft,
                    title: const Text('Info'),
                    description: const Text(
                      'This account will be updated once you exit',
                    ),
                    onNotificationPressed: () {
                      notification?.dismiss();
                    },
                    showProgressIndicator: false,
                    onDismiss: () {},
                    icon: const Icon(
                      Icons.ac_unit_rounded,
                      color: Colors.amber,
                    ),
                  );
                  notification?.show(context);
                },
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Info theme notification\n(center left)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  ElegantNotification(
                    width: 360,
                    position: Alignment.centerRight,
                    animation: AnimationType.fromRight,
                    stackedOptions: StackedOptions(
                      key: 'top',
                      type: StackedType.same,
                      itemOffset: const Offset(-1, -6),
                    ),
                    title: const Text(
                      'New version',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    description: const Text(
                      'A new version is available to you please update.',
                    ),
                    progressIndicatorColor: Colors.orange,
                    onDismiss: () {},
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Custom notification\n(center right)',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ElegantNotification.info(
                    width: 360,
                    position: Alignment.bottomLeft,
                    animation: AnimationType.fromLeft,
                    title: const Text('Info'),
                    description: const Text(
                      'This account will be updated once you exit',
                    ),
                    action: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Link',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    showProgressIndicator: false,
                    autoDismiss: false,
                    onLongPress: () {
                      print('Hello world');
                    },
                    onDismiss: () {},
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Notification with action\n(bottom left)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  ElegantNotification(
                    description: const Text(
                      'This is the easiest way to display an elegant notification',
                    ),
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Easiest way to display elegant notification',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ElegantNotification(
                    width: 360,
                    position: Alignment.topRight,
                    animation: AnimationType.fromRight,
                    description: const Text(
                      'You can now leave the dashboard.',
                    ),
                    icon: const Icon(
                      Icons.dashboard_customize_outlined,
                      color: Colors.purple,
                    ),
                    progressIndicatorColor: Colors.purple,
                    showProgressIndicator: false,
                    autoDismiss: false,
                    closeButton: (dismiss) => Container(
                      margin: Directionality.of(context) == TextDirection.rtl
                          ? const EdgeInsets.only(left: 20)
                          : const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        onPressed: dismiss,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Colors.purple, // <-- Button color
                          foregroundColor: Colors.white, // <-- Splash color
                        ),
                        child: const Icon(Icons.logout, color: Colors.white),
                      ),
                    ),
                    onDismiss: () {},
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Notification with custom close button\n(top right)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  ElegantNotification.success(
                    key: const Key('value'),
                    description: const Text(
                      'Your account has been created succesfully',
                    ),
                    progressBarHeight: 10,
                    progressBarPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    toastDuration: const Duration(seconds: 5),
                    progressIndicatorBackground: Colors.green[100]!,
                    longPressDuration: const Duration(seconds: 4),
                    onLongPress: () {
                      print('Hello world');
                    },
                  ).show(context);
                },
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Custom progress bar sizes',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
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
