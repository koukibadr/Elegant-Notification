import 'dart:async';

import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:elegant_notification/resources/dimens.dart';
import 'package:elegant_notification/resources/toast_content.dart';
import 'package:flutter/material.dart';
import 'package:elegant_notification/resources/constants.dart';

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

  late Widget? icon;

  late int toastDuration;

  final Function? onCloseButtonPressed;
  final Function? onProgressFinished;

  late double iconSize;

  final ANIMATION animation;
  final Duration animationDuration;

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
      this.toastDuration = 2500,
      this.onCloseButtonPressed,
      this.onProgressFinished,
      this.animation = ANIMATION.FROM_LEFT,
      this.animationDuration = DEFAULT_ANIMATION_DURATION}) {
    this.notificationType = NOTIFICATION_TYPE.CUSTOM;
    this.iconSize = DEFAULT_ICON_SIZE;
  }

  ElegantNotification.success(
      {required this.title,
      required this.description,
      this.displayCloseButton = true,
      this.toastDuration = 2500,
      this.onCloseButtonPressed,
      this.onProgressFinished,
      this.iconSize = DEFAULT_ICON_SIZE,
      this.animation = ANIMATION.FROM_LEFT,
      this.animationDuration = DEFAULT_ANIMATION_DURATION}) {
    this.shadowColor = Colors.grey;
    this.background = Colors.white;
    this.radius = 5;
    this.enableShadow = true;
    this.showProgressIndicator = true;
    this.notificationType = NOTIFICATION_TYPE.SUCCESS;
    this.progressIndicatorColor = SUCCESS_COLOR;
    this.icon = null;
  }

  ElegantNotification.error(
      {required this.title,
      required this.description,
      this.displayCloseButton = true,
      this.toastDuration = 2500,
      this.onCloseButtonPressed,
      this.onProgressFinished,
      this.iconSize = DEFAULT_ICON_SIZE,
      this.animation = ANIMATION.FROM_LEFT,
      this.animationDuration = DEFAULT_ANIMATION_DURATION}) {
    this.shadowColor = Colors.grey;
    this.background = Colors.white;
    this.radius = 5;
    this.enableShadow = true;
    this.showProgressIndicator = true;
    this.notificationType = NOTIFICATION_TYPE.ERROR;
    this.progressIndicatorColor = ERROR_COLOR;
    this.icon = null;
  }

  ElegantNotification.info(
      {required this.title,
      required this.description,
      this.displayCloseButton = true,
      this.toastDuration = 2500,
      this.onCloseButtonPressed,
      this.onProgressFinished,
      this.iconSize = DEFAULT_ICON_SIZE,
      this.animation = ANIMATION.FROM_LEFT,
      this.animationDuration = DEFAULT_ANIMATION_DURATION}) {
    this.shadowColor = Colors.grey;
    this.background = Colors.white;
    this.radius = 5;
    this.enableShadow = true;
    this.showProgressIndicator = true;
    this.notificationType = NOTIFICATION_TYPE.INFO;
    this.progressIndicatorColor = INFO_COLOR;
    this.icon = null;
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

class _ElegantNotificationState extends State<ElegantNotification>
    with SingleTickerProviderStateMixin {
  double progressValue = 1;

  late Timer notificationTimer;
  late Timer closeTimer;

  late Animation<Offset> offsetAnimation;
  late AnimationController slideController;

  @override
  void initState() {
    super.initState();
    notificationTimer = Timer.periodic(
        Duration(milliseconds: this.widget.toastDuration ~/ 10), (Timer timer) {
      setState(() {
        this.progressValue = this.progressValue - 0.1;
      });
    });
    closeTimer = Timer(Duration(milliseconds: this.widget.toastDuration), () {
      slideController.reverse();
      slideController.addListener(() {
        if (slideController.isDismissed) {
          Navigator.pop(context);
          this.widget.onProgressFinished?.call();
        }
      });
    });
    _initializeAnimation();
  }

  _initializeAnimation() {
    slideController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    offsetAnimation = Tween<Offset>(
      begin: const Offset(-2, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: slideController, curve: Curves.ease));
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      slideController.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    notificationTimer.cancel();
    closeTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SlideTransition(
          position: this.offsetAnimation,
          child: Container(
            width: TOAST_WIDTH,
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
                Expanded(
                    child: ToastContent(
                        title: this.widget.title,
                        description: this.widget.description,
                        displayCloseButton: this.widget.displayCloseButton,
                        notificationType: this.widget.notificationType,
                        icon: this.widget.icon,
                        onCloseButtonPressed: () {
                          slideController.reverse();
                          this.widget.onCloseButtonPressed?.call();
                        },
                        iconSize: this.widget.iconSize)),
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
        ),
      ],
    );
  }
}
