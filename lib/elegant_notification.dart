import 'dart:async';

import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:elegant_notification/resources/constants.dart';
import 'package:elegant_notification/resources/dimens.dart';
import 'package:elegant_notification/widgets/animated_progress_bar.dart';
import 'package:elegant_notification/widgets/toast_content.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElegantNotification extends StatefulWidget {
  ElegantNotification({
    Key? key,
    this.title,
    required this.description,
    required this.icon,
    this.shadowColor = defaultShadowColor,
    this.background = defaultBackgroundColor,
    this.radius = defaultRadiusValue,
    this.enableShadow = defaultEnableShadowValue,
    this.showProgressIndicator = defaultShowProgressIndicatorValue,
    this.displayCloseButton = defaultCloseButtonDisplay,
    this.progressIndicatorColor = defaultProgressColor,
    this.toastDuration = notificationToastDuration,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.animation = defaultAnimationValue,
    this.animationDuration = defaultAnimationDuration,
    this.iconSize = defaultIconSize,
    this.notificationPosition = defaultNotificationAlignValue,
    this.action,
    this.onActionPressed,
    this.autoDismiss = defaultAutoDismiss,
    this.height,
    this.width,
    this.dismissible = defaultDismissible,
    this.onDismiss,
  }) : super(key: key) {
    notificationType = NOTIFICATION_TYPE.custom;

    if (showProgressIndicator) {
      assert(autoDismiss != false);
    }
    if (action != null) {
      assert(onActionPressed != null);
    }
    if (!dismissible) {
      assert(onDismiss == null);
    }

    if (notificationPosition == NOTIFICATION_POSITION.bottom) {
      assert(animation != ANIMATION.fromTop);
    } else if (notificationPosition == NOTIFICATION_POSITION.top) {
      assert(animation != ANIMATION.fromBottom);
    }
  }

  ElegantNotification.success({
    Key? key,
    this.title,
    required this.description,
    this.background = defaultBackgroundColor,
    this.displayCloseButton = defaultCloseButtonDisplay,
    this.toastDuration = notificationToastDuration,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = defaultIconSize,
    this.animation = defaultAnimationValue,
    this.animationDuration = defaultAnimationDuration,
    this.showProgressIndicator = defaultShowProgressIndicatorValue,
    this.notificationPosition = defaultNotificationAlignValue,
    this.action,
    this.onActionPressed,
    this.autoDismiss = defaultAutoDismiss,
    this.height,
    this.width,
    this.dismissible = defaultDismissible,
    this.onDismiss,
  }) : super(key: key) {
    notificationType = NOTIFICATION_TYPE.success;
    progressIndicatorColor = successColor;
    icon = null;

    if (showProgressIndicator) {
      assert(autoDismiss != false);
    }
    if (action != null) {
      assert(onActionPressed != null);
    }
    if (!dismissible) {
      assert(onDismiss == null);
    }

    if (notificationPosition == NOTIFICATION_POSITION.bottom) {
      assert(animation != ANIMATION.fromTop);
    } else if (notificationPosition == NOTIFICATION_POSITION.top) {
      assert(animation != ANIMATION.fromBottom);
    }
  }

  ElegantNotification.error({
    Key? key,
    this.title,
    required this.description,
    this.background = defaultBackgroundColor,
    this.displayCloseButton = defaultCloseButtonDisplay,
    this.toastDuration = notificationToastDuration,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = defaultIconSize,
    this.animation = defaultAnimationValue,
    this.animationDuration = defaultAnimationDuration,
    this.showProgressIndicator = defaultShowProgressIndicatorValue,
    this.notificationPosition = defaultNotificationAlignValue,
    this.action,
    this.onActionPressed,
    this.autoDismiss = defaultAutoDismiss,
    this.height,
    this.width,
    this.dismissible = defaultDismissible,
    this.onDismiss,
  }) : super(key: key) {
    notificationType = NOTIFICATION_TYPE.error;
    progressIndicatorColor = errorColor;
    icon = null;

    if (showProgressIndicator) {
      assert(autoDismiss != false);
    }
    if (action != null) {
      assert(onActionPressed != null);
    }
    if (!dismissible) {
      assert(onDismiss == null);
    }

    if (notificationPosition == NOTIFICATION_POSITION.bottom) {
      assert(animation != ANIMATION.fromTop);
    } else if (notificationPosition == NOTIFICATION_POSITION.top) {
      assert(animation != ANIMATION.fromBottom);
    }
  }

  ElegantNotification.info({
    Key? key,
    this.title,
    required this.description,
    this.background = defaultBackgroundColor,
    this.displayCloseButton = defaultCloseButtonDisplay,
    this.toastDuration = notificationToastDuration,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = defaultIconSize,
    this.animation = defaultAnimationValue,
    this.animationDuration = defaultAnimationDuration,
    this.showProgressIndicator = defaultShowProgressIndicatorValue,
    this.notificationPosition = defaultNotificationAlignValue,
    this.action,
    this.onActionPressed,
    this.autoDismiss = defaultAutoDismiss,
    this.height,
    this.width,
    this.dismissible = defaultDismissible,
    this.onDismiss,
  }) : super(key: key) {
    notificationType = NOTIFICATION_TYPE.info;
    progressIndicatorColor = inforColor;
    icon = null;

    if (showProgressIndicator) {
      assert(autoDismiss != false);
    }
    if (action != null) {
      assert(onActionPressed != null);
    }
    if (!dismissible) {
      assert(onDismiss == null);
    }

    if (notificationPosition == NOTIFICATION_POSITION.bottom) {
      assert(animation != ANIMATION.fromTop);
    } else if (notificationPosition == NOTIFICATION_POSITION.top) {
      assert(animation != ANIMATION.fromBottom);
    }
  }

  ///The toast title if any
  ///
  final Text? title;

  ///The toast description text (required)
  ///
  final Text description;

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
  ///fromTop,
  ///fromBottom,
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
  late Color shadowColor = Colors.grey;

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
  late double radius = defaultRadiusValue;

  ///How much the notification will take time,
  ///by default the duration is `2500 milliseconds`
  ///
  final Duration toastDuration;

  ///enable or disable the shadow rendering
  ///by default it's true
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  ///
  late bool enableShadow = true;

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
  final Function()? onCloseButtonPressed;

  ///Function invoked when the notification is closed after the finish of the progress indicator
  ///
  final Function()? onProgressFinished;

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

  ///The type of the align set on the notification
  ///possible values
  ///```dart
  ///{
  ///top,
  ///center,
  ///bottom
  ///}
  ///```
  ///default value `top`
  ///
  final NOTIFICATION_POSITION notificationPosition;

  ///Action widget rendered with clickable inkwell
  ///by default `action == null`
  final Widget? action;

  ///Function invoked when pressing `action` widget
  ///must be not null when `action != null`
  final Function()? onActionPressed;

  ///define whether the notification will be dismissed automatically or not
  ///by default `autoDimiss == false`
  final bool autoDismiss;

  ///the width of the notification widget
  final double? width;

  ///the height of the notification widget
  final double? height;

  ///dismiss notification by tapping outside
  ///by default `dismissible == false`
  final bool dismissible;

  ///Function invoked when tapping outside the notification
  final Function()? onDismiss;

  ///use to know if notification close by another way than dismiss
  late bool canLaunchActionOnDismiss = true;

  ///display the notification on the screen
  ///[context] the context of the application
  void show(BuildContext context) {
    double heightNotification = height ?? MediaQuery.of(context).size.height * 0.12;
    double paddingTop = MediaQuery.of(context).size.height - 70 - heightNotification;
    Navigator.of(context).push(
      PageRouteBuilder(
        barrierDismissible: dismissible,
        pageBuilder: (context, _, __) => AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(0),
          insetPadding: EdgeInsets.fromLTRB(70, paddingTop, 70, 70),
          elevation: 0,
          content: this,
        ),
        opaque: false,
      ),
    ).then((val){
      if(canLaunchActionOnDismiss) {
        onDismiss?.call();
      }
    });
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

    closeTimer = Timer(widget.toastDuration, () {
      slideController.reverse();
      slideController.addListener(() {
        if (slideController.isDismissed) {
          Navigator.pop(context);
          widget.onProgressFinished?.call();
          widget.canLaunchActionOnDismiss = false;
        }
      });
    });
    if (!widget.autoDismiss) {
      closeTimer.cancel();
    }
    _initializeAnimation();
  }

  void _initializeAnimation() {
    slideController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    switch (widget.animation) {
      case ANIMATION.fromLeft:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(-2, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.ease,
          ),
        );
        break;
      case ANIMATION.fromRight:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(2, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.ease,
          ),
        );
        break;
      case ANIMATION.fromTop:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -7),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.ease,
          ),
        );
        break;
      case ANIMATION.fromBottom:
        offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 4),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: slideController,
            curve: Curves.ease,
          ),
        );
        break;
      default:
    }

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      slideController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _getNotificationAlign(),
      child: SlideTransition(
        position: offsetAnimation,
        child: Container(
          width: widget.width ?? MediaQuery.of(context).size.width * 0.7,
          height: widget.height ?? MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.background,
            boxShadow: widget.enableShadow
                ? [
                    BoxShadow(
                      color: widget.shadowColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1), // changes position of shadow
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
                    widget.onCloseButtonPressed?.call();
                    widget.canLaunchActionOnDismiss = false;
                  },
                  iconSize: widget.iconSize,
                  action: widget.action,
                  onActionPressed: widget.onActionPressed,
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
    );
  }

  Alignment _getNotificationAlign() {
    switch (widget.notificationPosition) {
      case NOTIFICATION_POSITION.top:
        return Alignment.topCenter;
      case NOTIFICATION_POSITION.center:
        return Alignment.center;
      case NOTIFICATION_POSITION.bottom:
        return Alignment.bottomCenter;
      default:
        return Alignment.topCenter;
    }
  }

  @override
  void dispose() {
    slideController.dispose();
    closeTimer.cancel();
    super.dispose();
  }
}
