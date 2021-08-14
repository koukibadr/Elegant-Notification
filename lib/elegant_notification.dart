import 'dart:async';

import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:elegant_notification/resources/dimens.dart';
import 'package:elegant_notification/resources/toast_content.dart';
import 'package:flutter/material.dart';
import 'package:elegant_notification/resources/constants.dart';

// ignore: must_be_immutable
class ElegantNotification extends StatefulWidget {
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
      this.toastDuration = NOTIFICATION_TOAST_DURATION,
      this.onCloseButtonPressed,
      this.onProgressFinished,
      this.animation = ANIMATION.FROM_LEFT,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.titleStyle = DEFAULT_TITLE_STYLE,
      this.descriptionStyle = DEFAULT_DESCRIPTION_STYLE,
      this.iconSize = DEFAULT_ICON_SIZE}) {
    this.notificationType = NOTIFICATION_TYPE.CUSTOM;
  }

  ElegantNotification.success(
      {required this.title,
      required this.description,
      this.displayCloseButton = true,
      this.toastDuration = NOTIFICATION_TOAST_DURATION,
      this.onCloseButtonPressed,
      this.onProgressFinished,
      this.iconSize = DEFAULT_ICON_SIZE,
      this.animation = ANIMATION.FROM_LEFT,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.titleStyle = DEFAULT_TITLE_STYLE,
      this.descriptionStyle = DEFAULT_DESCRIPTION_STYLE}) {
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
      this.toastDuration = NOTIFICATION_TOAST_DURATION,
      this.onCloseButtonPressed,
      this.onProgressFinished,
      this.iconSize = DEFAULT_ICON_SIZE,
      this.animation = ANIMATION.FROM_LEFT,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.titleStyle = DEFAULT_TITLE_STYLE,
      this.descriptionStyle = DEFAULT_DESCRIPTION_STYLE}) {
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
      this.toastDuration = NOTIFICATION_TOAST_DURATION,
      this.onCloseButtonPressed,
      this.onProgressFinished,
      this.iconSize = DEFAULT_ICON_SIZE,
      this.animation = ANIMATION.FROM_LEFT,
      this.animationDuration = DEFAULT_ANIMATION_DURATION,
      this.titleStyle = DEFAULT_TITLE_STYLE,
      this.descriptionStyle = DEFAULT_DESCRIPTION_STYLE}) {
    this.shadowColor = Colors.grey;
    this.background = Colors.white;
    this.radius = 5;
    this.enableShadow = true;
    this.showProgressIndicator = true;
    this.notificationType = NOTIFICATION_TYPE.INFO;
    this.progressIndicatorColor = INFO_COLOR;
    this.icon = null;
  }

  ///The toast title String (required)
  ///
  final String title;

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
  ///FROM_LEFT,
  ///FROM_RIGHT,
  ///FROM_TOP
  ///}
  ///```
  ///default value `FROM_LEFT`
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
  ///SUCCESS,
  ///ERROR,
  ///INFO,
  ///CUSTOM
  ///}
  ///```
  late NOTIFICATION_TYPE notificationType;

  ///display the notification on the screen
  ///[context] the context of the application
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

    switch (this.widget.animation) {
      case ANIMATION.FROM_LEFT:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(-2, 0),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: slideController, curve: Curves.ease));
        break;
      case ANIMATION.FROM_RIGHT:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(2, 0),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: slideController, curve: Curves.ease));
        break;
      case ANIMATION.FROM_TOP:
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
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.12,
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
                          notificationTimer.cancel();
                          closeTimer.cancel();
                          slideController.reverse();
                          slideController.dispose();
                          this.widget.onCloseButtonPressed?.call();
                        },
                        iconSize: this.widget.iconSize,
                        titleStyle: this.widget.titleStyle,
                        descriptionStyle: this.widget.descriptionStyle)),
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
