import 'dart:async';

import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:elegant_notification/resources/constants.dart';
import 'package:elegant_notification/resources/extensions.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:elegant_notification/widgets/animated_progress_bar.dart';
import 'package:elegant_notification/widgets/overlay_manager.dart';
import 'package:elegant_notification/widgets/toast_content.dart';
import 'package:flutter/foundation.dart';
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
    this.stackedOptions,
    this.notificationMargin = 20,
    this.progressIndicatorColor = Colors.blue,
    this.toastDuration = const Duration(milliseconds: 3000),
    this.displayCloseButton = true,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.position = Alignment.topRight,
    this.animation = AnimationType.fromRight,
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
    this.isDismissible = true,
    this.dismissDirection = DismissDirection.horizontal,
    this.progressIndicatorBackground = greyColor,
    this.onNotificationPressed,
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
    this.stackedOptions,
    this.notificationMargin = 20,
    this.toastDuration = const Duration(milliseconds: 3000),
    this.displayCloseButton = true,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = defaultIconSize,
    this.position = Alignment.topRight,
    this.animation = AnimationType.fromRight,
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
    this.isDismissible = true,
    this.dismissDirection = DismissDirection.horizontal,
    this.progressIndicatorBackground = greyColor,
    this.onNotificationPressed,
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
    this.stackedOptions,
    this.notificationMargin = 20,
    this.toastDuration = const Duration(milliseconds: 3000),
    this.displayCloseButton = true,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = defaultIconSize,
    this.position = Alignment.topRight,
    this.animation = AnimationType.fromRight,
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
    this.isDismissible = true,
    this.dismissDirection = DismissDirection.horizontal,
    this.progressIndicatorBackground = greyColor,
    this.onNotificationPressed,
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
    this.stackedOptions,
    this.notificationMargin = 20,
    this.toastDuration = const Duration(milliseconds: 3000),
    this.displayCloseButton = true,
    this.onCloseButtonPressed,
    this.onProgressFinished,
    this.iconSize = defaultIconSize,
    this.position = Alignment.topRight,
    this.animation = AnimationType.fromRight,
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
    this.isDismissible = true,
    this.dismissDirection = DismissDirection.horizontal,
    this.progressIndicatorBackground = greyColor,
    this.onNotificationPressed,
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
    if (onNotificationPressed != null) {
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

  /// The margin between the notification and the edge of the screen
  final double notificationMargin;

  /// The options for the stacked mode
  final StackedOptions? stackedOptions;

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
  final void Function()? onNotificationPressed;

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

  ///The notification position in the screen
  ///by default the position is set to `Alignment.topRight`
  final Alignment position;

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

  ///The direction of the dismissible widget
  ///by default it's `DismissDirection.horizontal`
  final DismissDirection dismissDirection;

  ///If the notification is dismissible or not
  ///by default it's true
  final bool isDismissible;

  /// Overlay that does not block the screen
  OverlayEntry? overlayEntry;

  ///The progress indicator background color
  ///by default it's grey
  final Color progressIndicatorBackground;

  late Timer _closeTimer;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _slideController;
  final OverlayManager overlayManager = OverlayManager();

  final Key uniqueKey = UniqueKey();

  String get internalKey => stackedOptions != null
      ? '${stackedOptions?.key}%${uniqueKey.toString()}'
      : uniqueKey.toString();

  ///display the notification on the screen
  ///[context] the context of the application
  void show(BuildContext context) {
    overlayEntry = _overlayEntryBuilder();
    Overlay.maybeOf(context)?.insert(overlayEntry!);
    overlayManager.addOverlay(internalKey, overlayEntry!);
  }

  void closeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    overlayManager.removeOverlay(internalKey);
  }

  Future<void> dismiss() {
    _closeTimer.cancel();
    return _slideController.reverse().then((value) {
      onDismiss?.call();
      closeOverlay();
    });
  }

  int get stackOverlaysLength => overlayManager.overlays.keys
      .where(
        (element) => element.split('%').first == internalKey.split('%').first,
      )
      .length;

  int get stackedItemPosition => overlayManager.overlays.keys
      .where(
        (element) => element.split('%').first == internalKey.split('%').first,
      )
      .toList()
      .indexWhere((element) => element == internalKey);

  double mainContainerHeight(BuildContext context) =>
      height ?? MediaQuery.of(context).size.height * 0.12;
  double mainContainerWidth(BuildContext context) =>
      width ?? MediaQuery.of(context).size.width * 0.7;

  double getTopPos(context) {
    if (stackedOptions?.type == StackedType.above) {
      return -(mainContainerHeight(context) * stackedItemPosition) +
          (stackedOptions?.itemOffset.dy ?? 0) * stackedItemPosition;
    } else if (stackedOptions?.type == StackedType.below) {
      return (mainContainerHeight(context) * stackedItemPosition) +
          (stackedOptions?.itemOffset.dy ?? 0) * stackedItemPosition;
    } else {
      return (stackedOptions?.itemOffset.dy ?? 0) *
          (stackOverlaysLength - 1 - stackedItemPosition);
    }
  }

  double alignmentToLeftPos(BuildContext context) {
    if (position.x == 1) {
      return MediaQuery.of(context).size.width -
          mainContainerWidth(context) -
          notificationMargin;
    } else if (position.x == -1) {
      return notificationMargin;
    } else {
      return ((position.x + 1) / 2) * MediaQuery.of(context).size.width -
          (mainContainerWidth(context) / 2);
    }
  }

  double alignmentToTopPos(BuildContext context) {
    if (position.y == 1) {
      return MediaQuery.of(context).size.height -
          mainContainerHeight(context) -
          notificationMargin;
    } else if (position.y == -1) {
      return notificationMargin;
    } else {
      return ((position.y + 1) / 2) * MediaQuery.of(context).size.height -
          (mainContainerHeight(context) / 2);
    }
  }

  double getScale() {
    if (stackedOptions?.scaleFactor != null) {
      return clampDouble(
        (1 -
            (stackedOptions?.scaleFactor ?? 0) *
                (stackOverlaysLength - (stackedItemPosition + 1))),
        0,
        1,
      );
    } else {
      return 1.0;
    }
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      opaque: false,
      builder: (context) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: alignmentToLeftPos(context) +
              (stackedOptions?.itemOffset.dx ?? 0) *
                  (stackOverlaysLength - 1 - stackedItemPosition),
          top: alignmentToTopPos(context) + getTopPos(context),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 300),
            scale: getScale(),
            alignment: Alignment.bottomCenter,
            child: Material(
              color: Colors.transparent,
              child: this,
            ),
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
    widget._closeTimer.cancel();
    widget._slideController.reverse();
    widget.onDismiss?.call();
    widget.closeOverlay();
  }

  double get mainContainerHeight =>
      widget.height ?? MediaQuery.of(context).size.height * 0.12;
  double get mainContainerWidth =>
      widget.width ?? MediaQuery.of(context).size.width * 0.7;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget._offsetAnimation,
      child: Dismissible(
        key: widget.uniqueKey,
        direction: widget.isDismissible
            ? widget.dismissDirection
            : DismissDirection.none,
        onDismissed: (direction) {
          widget.onDismiss?.call();
          widget.closeOverlay();
        },
        child: InkWell(
          onTap: widget.onNotificationPressed,
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
                    notificationType: widget.notificationType,
                    icon: widget.icon,
                    displayCloseButton: widget.onNotificationPressed == null
                        ? widget.displayCloseButton
                        : false,
                    closeButton: widget.closeButton,
                    onCloseButtonPressed: closeNotification,
                    iconSize: widget.iconSize,
                    action: widget.action,
                    onActionPressed: widget.onActionPressed == null
                        ? null
                        : () {
                            widget.onActionPressed!();
                          },
                  ),
                ),
                if (widget.showProgressIndicator)
                  Padding(
                    padding:
                        widget.progressBarPadding ?? const EdgeInsets.all(0),
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
