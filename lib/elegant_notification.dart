import 'dart:async';

import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:elegant_notification/resources/toast_content.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElegantNotification extends StatefulWidget {
  late Color shadowColor;
  late Color background;
  late Color progressIndicatorColor;
  late double radius;
  late bool enableShadow;
  late bool showProgressIndicator;
  final bool displayCloseButton;

  final String title;
  final String description;

  late NOTIFICATION_TYPE notificationType;

  late Widget icon;

  late Duration toastDuration;

  ElegantNotification(
      {required this.title,
      required this.description,
      required this.icon,
      this.shadowColor = Colors.grey,
      this.background = Colors.white,
      this.radius = 5,
      this.enableShadow = true,
      this.showProgressIndicator = true,
      this.displayCloseButton = true,
      this.progressIndicatorColor = Colors.blue,
      this.toastDuration = const Duration(milliseconds: 2500)}) {
    this.notificationType = NOTIFICATION_TYPE.CUSTOM;
  }

  ElegantNotification.success(
      {required this.title,
      required this.description,
      this.displayCloseButton = true,
      this.toastDuration = const Duration(milliseconds: 2500)}) {
    this.shadowColor = Colors.grey;
    this.background = Colors.white;
    this.radius = 5;
    this.enableShadow = true;
    this.showProgressIndicator = true;
    this.notificationType = NOTIFICATION_TYPE.SUCCESS;
    this.progressIndicatorColor = SUCCESS_COLOR;
  }

  ElegantNotification.error(
      {required this.title,
      required this.description,
      this.displayCloseButton = true,
      this.toastDuration = const Duration(milliseconds: 2500)}) {
    this.shadowColor = Colors.grey;
    this.background = Colors.white;
    this.radius = 5;
    this.enableShadow = true;
    this.showProgressIndicator = true;
    this.notificationType = NOTIFICATION_TYPE.ERROR;
    this.progressIndicatorColor = ERROR_COLOR;
  }

  ElegantNotification.info(
      {required this.title,
      required this.description,
      this.displayCloseButton = true,
      this.toastDuration = const Duration(milliseconds: 2500)}) {
    this.shadowColor = Colors.grey;
    this.background = Colors.white;
    this.radius = 5;
    this.enableShadow = true;
    this.showProgressIndicator = true;
    this.notificationType = NOTIFICATION_TYPE.INFO;
    this.progressIndicatorColor = INFO_COLOR;
  }

  show(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, _, __) => AlertDialog(
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.all(0),
                insetPadding: EdgeInsets.all(70),
                elevation: 0,
                content: this,
              ),
          opaque: false),
    );
  }

  @override
  _ElegantNotificationState createState() => _ElegantNotificationState();
}

class _ElegantNotificationState extends State<ElegantNotification> {
  double progressValue = 1;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 150), (Timer timer) {
      setState(() {
        this.progressValue = this.progressValue - 0.1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 400,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(this.widget.radius),
            color: this.widget.background,
            boxShadow: this.widget.enableShadow
                ? [
                    BoxShadow(
                      color: this.widget.shadowColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]
                : null,
          ),
          child: Column(
            children: [
              Expanded(child: ToastContent()),
              Visibility(
                visible: this.widget.showProgressIndicator,
                child: LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: GREY_COLOR,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        this.widget.progressIndicatorColor)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
