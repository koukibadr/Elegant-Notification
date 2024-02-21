import 'dart:async';

import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:elegant_notification/resources/constants.dart';
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
    this.position = Alignment.topRight,
    this.animation = AnimationType.fromRight,
    this.dismissDirection = DismissDirection.horizontal,
    this.isDismissible = true,
    this.animationDuration = const Duration(milliseconds: 600),
    this.iconSize = defaultIconSize,
    this.action,
    this.onActionPressed,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.progressBarHeight,
    this.progressBarWidth,
    this.progressBarPadding,
    this.onDismiss,
    this.progressIndicatorBackground = greyColor,
    this.onTap,
    this.closeOnTap = false,
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
    this.iconSize = defaultIconSize,
    this.notificationPosition = NotificationPosition.topRight,
    this.position = Alignment.topRight,
    this.animation = AnimationType.fromRight,
    this.dismissDirection = DismissDirection.horizontal,
    this.isDismissible = true,
    this.animationDuration = const Duration(milliseconds: 600),
    this.showProgressIndicator = true,
    this.action,
    this.onActionPressed,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.progressBarHeight,
    this.progressBarWidth,
    this.progressBarPadding,
    this.onDismiss,
    this.progressIndicatorBackground = greyColor,
    this.onTap,
    this.closeOnTap = false,
  }) : super(key: key) {
    notificationType = NotificationType.success;
    progressIndicatorColor = notificationType.color();
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
    this.iconSize = defaultIconSize,
    this.notificationPosition = NotificationPosition.topRight,
    this.position = Alignment.topRight,
    this.animation = AnimationType.fromRight,
    this.dismissDirection = DismissDirection.horizontal,
    this.isDismissible = true,
    this.animationDuration = const Duration(milliseconds: 600),
    this.showProgressIndicator = true,
    this.action,
    this.onActionPressed,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.progressBarHeight,
    this.progressBarWidth,
    this.progressBarPadding,
    this.onDismiss,
    this.progressIndicatorBackground = greyColor,
    this.onTap,
    this.closeOnTap = false,
  }) : super(key: key) {
    notificationType = NotificationType.error;
    progressIndicatorColor = notificationType.color();
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
    this.iconSize = defaultIconSize,
    this.notificationPosition = NotificationPosition.topRight,
    this.position = Alignment.topRight,
    this.animation = AnimationType.fromRight,
    this.dismissDirection = DismissDirection.horizontal,
    this.isDismissible = true,
    this.animationDuration = const Duration(milliseconds: 600),
    this.showProgressIndicator = true,
    this.action,
    this.onActionPressed,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.progressBarHeight,
    this.progressBarWidth,
    this.progressBarPadding,
    this.onDismiss,
    this.progressIndicatorBackground = greyColor,
    this.onTap,
    this.closeOnTap = false,
  }) : super(key: key) {
    notificationType = NotificationType.info;
    progressIndicatorColor = notificationType.color();
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
    if (onTap != null) {
      assert(
        action == null && onActionPressed == null,
        'You can not set both an action and an onTap method',
      );
    }

    if (position == Alignment.centerRight) {
      assert(
        animation != AnimationType.fromLeft &&
            animation != AnimationType.fromBottom &&
            animation != AnimationType.fromTop,
      );
    } else if (position == Alignment.centerLeft) {
      assert(
        animation != AnimationType.fromRight &&
            animation != AnimationType.fromBottom &&
            animation != AnimationType.fromTop,
      );
    } else if (position == Alignment.topCenter) {
      assert(
        animation != AnimationType.fromBottom &&
            animation != AnimationType.fromLeft &&
            animation != AnimationType.fromRight,
      );
    } else if (position == Alignment.topRight) {
      assert(
        animation != AnimationType.fromLeft &&
            animation != AnimationType.fromBottom,
      );
    } else if (position == Alignment.topLeft) {
      assert(
        animation != AnimationType.fromRight &&
            animation != AnimationType.fromBottom,
      );
    } else if (position == Alignment.bottomCenter) {
      assert(
        animation != AnimationType.fromTop &&
            animation != AnimationType.fromLeft &&
            animation != AnimationType.fromRight,
      );
    } else if (position == Alignment.bottomRight) {
      assert(
        animation != AnimationType.fromLeft &&
            animation != AnimationType.fromTop,
      );
    } else if (position == Alignment.bottomLeft) {
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

  ///The size of the icon, by default it's 20px
  ///
  final double iconSize;

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
  final void Function()? onCloseButtonPressed;

  ///Function invoked when the notification is closed after the finish of the progress indicator
  ///
  final void Function()? onProgressFinished;

  ///Function invoked when the user taps on the notification
  final void Function()? onTap;

  ///Whether to close the notification when the tap on an action or on the
  ///notification itself
  final bool closeOnTap;

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

  @Deprecated('`notificationPosition` is depreacted use `position` instead')
  final NotificationPosition notificationPosition;
  final Alignment position;

  ///define whether the notification will be dismissible or not
  ///by default `isDismissible == true`
  final bool isDismissible;

  ///The direction of the dismiss action
  ///by default `dismissDirection == DismissDirection.horizontal`
  final DismissDirection dismissDirection;

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

  ///progress bar indicator width, by default it's null so it takes the widget's width
  final double? progressBarWidth;

  ///progress bar indicator height, by default it's null so it takes the widget's height
  final double? progressBarHeight;

  ///progress bar indicator padding constraints
  final EdgeInsetsGeometry? progressBarPadding;

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

  Future<void> dismiss() {
    _closeTimer.cancel();
    return _slideController.reverse().then((value) {
      onDismiss?.call();
      closeOverlay();
    });
  }

  late Timer _closeTimer;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _slideController;

  OverlayEntry _overlayEntryBuilder() {
    final dismissibleKey = UniqueKey();
    return OverlayEntry(
      opaque: false,
      builder: (context) {
        return SafeArea(
          child: AlertDialog(
            alignment: position,
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0),
            insetPadding: const EdgeInsets.all(30),
            elevation: 0,
            content: isDismissible
                ? Dismissible(
                    key: dismissibleKey,
                    direction: dismissDirection,
                    onDismissed: (direction) {
                      _closeTimer.cancel();
                      onDismiss?.call();
                      closeOverlay();
                    },
                    child: this,
                  )
                : this,
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
  @override
  void initState() {
    super.initState();
    widget._closeTimer = Timer(widget.toastDuration, () {
      widget._slideController.reverse();
      widget._slideController.addListener(() {
        if (widget._slideController.isDismissed) {
          widget.onProgressFinished?.call();
          widget.closeOverlay();
        }
      });
    });
    if (!widget.autoDismiss) {
      widget._closeTimer.cancel();
    }
    _initializeAnimation();
  }

  void _initializeAnimation() {
    widget._slideController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    switch (widget.animation) {
      case AnimationType.fromLeft:
        widget._offsetAnimation = Tween<Offset>(
          begin: const Offset(-2, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: widget._slideController,
            curve: Curves.ease,
          ),
        );
        break;
      case AnimationType.fromRight:
        widget._offsetAnimation = Tween<Offset>(
          begin: const Offset(2, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: widget._slideController,
            curve: Curves.ease,
          ),
        );
        break;
      case AnimationType.fromTop:
        widget._offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -7),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: widget._slideController,
            curve: Curves.ease,
          ),
        );
        break;
      case AnimationType.fromBottom:
        widget._offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 4),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: widget._slideController,
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
      (_) => widget._slideController.forward(),
    );
  }

  void closeNotification() {
    widget.onCloseButtonPressed?.call();
    closeTimer.cancel();
    slideController.reverse();
    widget.onDismiss?.call();
    widget.closeOverlay();
  }

  void closeNotification() {
    widget.onCloseButtonPressed?.call();
    closeTimer.cancel();
    slideController.reverse();
    widget.onDismiss?.call();
    widget.closeOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offsetAnimation,
      child: InkWell(
        onTap: widget.onTap == null
            ? null
            : () {
                widget.onTap!();
                if (widget.closeOnTap) {
                  closeNotification();
                }
              },
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
                  displayCloseButton:
                      widget.onTap == null ? widget.displayCloseButton : false,
                  closeButton: widget.closeButton,
                  onCloseButtonPressed: closeNotification,
                  iconSize: widget.iconSize,
                  action: widget.action,
                  onActionPressed: widget.onActionPressed == null
                      ? null
                      : () {
                          widget.onActionPressed!();
                          if (widget.closeOnTap) {
                            closeNotification();
                          }
                        },
                ),
              ),
              if (widget.showProgressIndicator)
                Padding(
                  padding: widget.progressBarPadding ?? const EdgeInsets.all(0),
                  child: SizedBox(
                    width: widget.progressBarWidth,
                    height: widget.progressBarHeight,
                    child: AnimatedProgressBar(
                      foregroundColor: widget.progressIndicatorColor,
                      duration: widget.toastDuration,
                      backgroundColor: widget.progressIndicatorBackground,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget._slideController.dispose();
    widget._closeTimer.cancel();
    super.dispose();
  }
}
