import 'dart:async';

import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:elegant_notification/resources/extensions.dart';
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
    this.shadowColor = Colors.grey,
    this.background = Colors.white,
    this.radius = 5.0,
    this.enableShadow = true,
    this.showProgressIndicator = true,
    this.closeButton,
    this.progressIndicatorColor = Colors.blue,
    this.toastDuration = const Duration(milliseconds: 3000),
    this.displayCloseButton = true,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.notificationPosition = NotificationPosition.topRight,
    this.animation = AnimationType.fromRight,
    this.animationDuration = const Duration(milliseconds: 600),
    this.iconSize = 20,
    this.action,
    this.onActionPressed,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.onDismiss,
    this.progressIndicatorBackground = greyColor,
  }) : super(key: key) {
    notificationType = NotificationType.custom;
    checkAssertions();
  }

  ElegantNotification.success({
    Key? key,
    this.title,
    required this.description,
    this.background = Colors.white,
    this.closeButton,
    this.toastDuration = const Duration(milliseconds: 3000),
    this.displayCloseButton = true,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = 20,
    this.notificationPosition = NotificationPosition.topRight,
    this.animation = AnimationType.fromRight,
    this.animationDuration = const Duration(milliseconds: 600),
    this.showProgressIndicator = true,
    this.action,
    this.onActionPressed,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.onDismiss,
    this.progressIndicatorBackground = greyColor,
  }) : super(key: key) {
    notificationType = NotificationType.success;
    progressIndicatorColor = successColor;
    icon = null;
    checkAssertions();
  }

  ElegantNotification.error({
    Key? key,
    this.title,
    required this.description,
    this.background = Colors.white,
    this.closeButton,
    this.toastDuration = const Duration(milliseconds: 3000),
    this.displayCloseButton = true,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = 20,
    this.notificationPosition = NotificationPosition.topRight,
    this.animation = AnimationType.fromRight,
    this.animationDuration = const Duration(milliseconds: 600),
    this.showProgressIndicator = true,
    this.action,
    this.onActionPressed,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.onDismiss,
    this.progressIndicatorBackground = greyColor,
  }) : super(key: key) {
    notificationType = NotificationType.error;
    progressIndicatorColor = errorColor;
    icon = null;
    checkAssertions();
  }

  ElegantNotification.info({
    Key? key,
    this.title,
    required this.description,
    this.background = Colors.white,
    this.closeButton,
    this.toastDuration = const Duration(milliseconds: 3000),
    this.displayCloseButton = true,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = 20,
    this.notificationPosition = NotificationPosition.topRight,
    this.animation = AnimationType.fromRight,
    this.animationDuration = const Duration(milliseconds: 600),
    this.showProgressIndicator = true,
    this.action,
    this.onActionPressed,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.onDismiss,
    this.progressIndicatorBackground = greyColor,
  }) : super(key: key) {
    notificationType = NotificationType.info;
    progressIndicatorColor = inforColor;
    icon = null;
    checkAssertions();
  }

  ///Checks assertions for various constructors of this package
  void checkAssertions() {
    if (showProgressIndicator) {
      assert(autoDismiss != false);
    }
    if (action != null) {
      assert(onActionPressed != null);
    }

    if (notificationPosition == NotificationPosition.centerRight) {
      assert(
        animation != AnimationType.fromLeft &&
            animation != AnimationType.fromBottom &&
            animation != AnimationType.fromTop,
      );
    } else if (notificationPosition == NotificationPosition.centerLeft) {
      assert(
        animation != AnimationType.fromRight &&
            animation != AnimationType.fromBottom &&
            animation != AnimationType.fromTop,
      );
    } else if (notificationPosition == NotificationPosition.topCenter) {
      assert(
        animation != AnimationType.fromBottom &&
            animation != AnimationType.fromLeft &&
            animation != AnimationType.fromRight,
      );
    } else if (notificationPosition == NotificationPosition.topRight) {
      assert(
        animation != AnimationType.fromLeft &&
            animation != AnimationType.fromBottom,
      );
    } else if (notificationPosition == NotificationPosition.topLeft) {
      assert(
        animation != AnimationType.fromRight &&
            animation != AnimationType.fromBottom,
      );
    } else if (notificationPosition == NotificationPosition.bottomCenter) {
      assert(
        animation != AnimationType.fromTop &&
            animation != AnimationType.fromLeft &&
            animation != AnimationType.fromRight,
      );
    } else if (notificationPosition == NotificationPosition.bottomRight) {
      assert(
        animation != AnimationType.fromLeft &&
            animation != AnimationType.fromTop,
      );
    } else if (notificationPosition == NotificationPosition.bottomLeft) {
      assert(
        animation != AnimationType.fromRight &&
            animation != AnimationType.fromTop,
      );
    }
  }

  ///The toast title widget
  final Widget? title;

  ///The toast description widget
  final Widget description;

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
  final AnimationType animation;

  ///The duration of the animation
  ///Default value `Duration(milliseconds: 600)`
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
  late double radius = 5.0;

  ///How much the notification will take time,
  ///by default the duration is `3000 milliseconds`
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

  ///Close widget rendered as the close function
  ///by default the close button is displayed, if you don't want it set `closeButton` to null
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  ///
  final Widget Function(void Function() dismissNotification)? closeButton;

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
  late NotificationType notificationType;

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
  final NotificationPosition notificationPosition;

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

  ///Function invoked when tapping outside the notification
  ///Or when pressing the back button of the phone
  ///or when tapping on the screen
  final Function()? onDismiss;

  //Overlay that does not block the screen
  OverlayEntry? overlayEntry;

  ///The progress indicator background color
  ///by default it's grey
  final Color progressIndicatorBackground;

  ///display the notification on the screen
  ///[context] the context of the application
  void show(BuildContext context) {
    overlayEntry = _overlayEntryBuilder();
    Overlay.maybeOf(context)?.insert(overlayEntry!);
  }

  void closeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      opaque: false,
      builder: (context) {
        return SafeArea(
          child: AlertDialog(
            alignment: notificationPosition.alignment,
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0),
            insetPadding: const EdgeInsets.all(30),
            elevation: 0,
            content: this,
          ),
        );
      },
    );
  }

  @override
  ElegantNotificationState createState() => ElegantNotificationState();
}

class ElegantNotificationState extends State<ElegantNotification>
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
          widget.onProgressFinished?.call();
          widget.closeOverlay();
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
      case AnimationType.fromLeft:
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
      case AnimationType.fromRight:
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
      case AnimationType.fromTop:
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
      case AnimationType.fromBottom:
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

    /// ! To support Flutter < 3.0.0
    /// This allows a value of type T or T?
    /// to be treated as a value of type T?.
    ///
    /// We use this so that APIs that have become
    /// non-nullable can still be used with `!` and `?`
    /// to support older versions of the API as well.
    T? ambiguate<T>(T? value) => value;

    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback(
      (_) => slideController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
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
                notificationType: widget.notificationType,
                icon: widget.icon,
                displayCloseButton: widget.displayCloseButton,
                closeButton: widget.closeButton,
                onCloseButtonPressed: () {
                  widget.onCloseButtonPressed?.call();
                  closeTimer.cancel();
                  slideController.reverse();
                  widget.onDismiss?.call();
                  widget.closeOverlay();
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
                backgroundColor: widget.progressIndicatorBackground,
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    slideController.dispose();
    closeTimer.cancel();
    super.dispose();
  }
}
