import 'dart:async';

import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:elegant_notification/resources/dimens.dart';
import 'package:elegant_notification/widgets/animated_progress_bar.dart';
import 'package:elegant_notification/widgets/toast_content.dart';
import 'package:flutter/material.dart';
import 'package:elegant_notification/resources/constants.dart';

// ignore: must_be_immutable
class ElegantNotification extends StatefulWidget {
  ElegantNotification({
    Key? key,
    this.title,
    required this.description,
    required this.icon,
    this.shadowColor = Colors.grey,
    this.background = Colors.white,
    this.radius = 5,
    this.enableShadow = true,
    this.showProgressIndicator = true,
    this.displayCloseButton = true,
    this.progressIndicatorColor = Colors.blue,
    this.toastDuration = notificationToastDuration,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.animation = ANIMATION.fromLeft,
    this.animationDuration = defaultAnimationDuration,
    this.titleStyle = defaultTitleStyle,
    this.descriptionStyle = defaultDescriptionStyle,
    this.iconSize = defaultIconSize,
  }) : super(key: key) {
    notificationType = NOTIFICATION_TYPE.custom;
  }

  ElegantNotification.success({
    Key? key,
    this.title,
    required this.description,
    this.displayCloseButton = true,
    this.toastDuration = notificationToastDuration,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = defaultIconSize,
    this.animation = ANIMATION.fromLeft,
    this.animationDuration = defaultAnimationDuration,
    this.titleStyle = defaultTitleStyle,
    this.descriptionStyle = defaultDescriptionStyle,
  }) : super(key: key) {
    shadowColor = Colors.grey;
    background = Colors.white;
    radius = 5;
    enableShadow = true;
    showProgressIndicator = true;
    notificationType = NOTIFICATION_TYPE.success;
    progressIndicatorColor = successColor;
    icon = null;
  }

  ElegantNotification.error({
    Key? key,
    this.title,
    required this.description,
    this.displayCloseButton = true,
    this.toastDuration = notificationToastDuration,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = defaultIconSize,
    this.animation = ANIMATION.fromLeft,
    this.animationDuration = defaultAnimationDuration,
    this.titleStyle = defaultTitleStyle,
    this.descriptionStyle = defaultDescriptionStyle,
  }) : super(key: key) {
    shadowColor = Colors.grey;
    background = Colors.white;
    radius = 5;
    enableShadow = true;
    showProgressIndicator = true;
    notificationType = NOTIFICATION_TYPE.error;
    progressIndicatorColor = errorColor;
    icon = null;
  }

  ElegantNotification.info({
    Key? key,
    this.title,
    required this.description,
    this.displayCloseButton = true,
    this.toastDuration = notificationToastDuration,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = defaultIconSize,
    this.animation = ANIMATION.fromLeft,
    this.animationDuration = defaultAnimationDuration,
    this.titleStyle = defaultTitleStyle,
    this.descriptionStyle = defaultDescriptionStyle,
  }) : super(key: key) {
    shadowColor = Colors.grey;
    background = Colors.white;
    radius = 5;
    enableShadow = true;
    showProgressIndicator = true;
    notificationType = NOTIFICATION_TYPE.info;
    progressIndicatorColor = inforColor;
    icon = null;
  }

  ///The toast title String if any
  ///
  final String? title;

  ///The title text style
  ///by default it's `TextStyle(fontWeight: FontWeight.bold, fontSize: 14)`
  ///
  final TextStyle titleStyle;

  ///The toast description text (required)
  ///
  final String description;

  ///The description text style
  ///by default it's `TextStyle(fontSize: 12)`
  ///
  final TextStyle descriptionStyle;

  ///The toast icon, required only if using the default constructor
  ///for other toast types (Success, Info, error) the icon is not changeable
  ///
  late Widget? icon;

  ///The size of the icon, by default it's 40px
  ///
  late double iconSize;

  ///The type of the animation set on the notification
  ///possible values
  ///```dart
  ///{
  ///fromLeft,
  ///fromRight,
  ///fromTop
  ///}
  ///```
  ///default value `fromLeft`
  ///
  final ANIMATION animation;

  ///The duration of the animation
  ///Default value `Duration(milliseconds: 100)`
  ///
  final Duration animationDuration;

  ///The shadow color applied on the notification widget
  /// by defualt it's `Colors.grey`
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  late Color shadowColor;

  /// the background color of the notification
  /// by default it's set to white
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  late Color background;

  ///The color of the progress
  ///by default it's blue
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  late Color progressIndicatorColor;

  ///the border radius of the notification widget
  ///this parameter it's only set if you are using the default constructor
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  ///
  late double radius;

  ///The duration how much the notification will take time, duration in milliseconds
  ///by default the duration is `2500 milliseconds`
  ///
  final int toastDuration;

  ///enable or disable the shadow rendering
  ///by default it's true
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  ///
  late bool enableShadow;

  ///enable or disable the progress indicator rendering
  ///by default the indicator is displayed
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  ///
  late bool showProgressIndicator;

  ///Display or hide the close button
  ///by default the close button is displayed
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  ///
  final bool displayCloseButton;

  ///Function invoked when user press on the close button
  final Function? onCloseButtonPressed;

  ///Function invoked when the notification is closed after the finish of the progress indicator
  ///
  final Function? onProgressFinished;

  ///The type of the notification, will be set automatically on every constructor
  ///possible values
  ///```dart
  ///{
  ///success,
  ///error,
  ///info,
  ///custom
  ///}
  ///```
  late NOTIFICATION_TYPE notificationType;

  ///display the notification on the screen
  ///[context] the context of the application
  void show(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, _, __) => AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.all(70),
          elevation: 0,
          content: this,
        ),
        opaque: false,
      ),
    );
  }

  @override
  _ElegantNotificationState createState() => _ElegantNotificationState();
}

class _ElegantNotificationState extends State<ElegantNotification>
    with SingleTickerProviderStateMixin {
  late Timer closeTimer;
  late Animation<Offset> offsetAnimation;
  late AnimationController slideController;

  @override
  void initState() {
    super.initState();
    closeTimer = Timer(Duration(milliseconds: widget.toastDuration), () {
      slideController.reverse();
      slideController.addListener(() {
        if (slideController.isDismissed) {
          Navigator.pop(context);
          widget.onProgressFinished?.call();
        }
      });
    });
    _initializeAnimation();
  }

  void _initializeAnimation() {
    slideController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    switch (widget.animation) {
      case ANIMATION.fromLeft:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(-2, 0),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: slideController, curve: Curves.ease));
        break;
      case ANIMATION.fromRight:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(2, 0),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: slideController, curve: Curves.ease));
        break;
      case ANIMATION.fromTop:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -7),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: slideController, curve: Curves.ease));
        break;
      default:
    }

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      slideController.forward();
    });
  }

  @override
  void dispose() {
    slideController.dispose();
    closeTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SlideTransition(
          position: offsetAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              color: widget.background,
              boxShadow: widget.enableShadow
                  ? [
                      BoxShadow(
                        color: widget.shadowColor.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ]
                  : null,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ToastContent(
                    title: widget.title,
                    description: widget.description,
                    displayCloseButton: widget.displayCloseButton,
                    notificationType: widget.notificationType,
                    icon: widget.icon,
                    onCloseButtonPressed: () {
                      closeTimer.cancel();
                      slideController.reverse();
                      slideController.dispose();
                      widget.onCloseButtonPressed?.call();
                    },
                    iconSize: widget.iconSize,
                    titleStyle: widget.titleStyle,
                    descriptionStyle: widget.descriptionStyle,
                  ),
                ),
                if (widget.showProgressIndicator)
                  AnimatedProgressBar(
                    foregroundColor: widget.progressIndicatorColor,
                    duration: widget.toastDuration,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
