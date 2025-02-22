import 'dart:async';

import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:elegant_notification/resources/constants.dart';
import 'package:elegant_notification/resources/overlay_helper.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:elegant_notification/widgets/animated_progress_bar.dart';
import 'package:elegant_notification/widgets/overlay_manager.dart';
import 'package:elegant_notification/widgets/toast_content.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElegantNotification extends StatefulWidget {
  ElegantNotification({
    Key? key,
    required this.description,
    this.title,
    this.icon,
    this.background = Colors.white,
    this.borderRadius,
    this.border,
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
    this.verticalDividerColor = greyColor,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.progressBarHeight,
    this.progressBarWidth,
    this.progressBarPadding,
    this.onDismiss,
    this.isDismissable = true,
    this.dismissDirection = DismissDirection.horizontal,
    this.progressIndicatorBackground = greyColor,
    this.onNotificationPressed,
    this.animationCurve = Curves.ease,
    this.shadow,
  }) : super(key: key) {
    _notificationType = NotificationType.custom;
    checkAssertions();
  }

  ElegantNotification.success({
    super.key,
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
    this.icon,
    this.position = Alignment.topRight,
    this.animation = AnimationType.fromRight,
    this.animationDuration = const Duration(milliseconds: 600),
    this.showProgressIndicator = true,
    this.action,
    this.verticalDividerColor = greyColor,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.progressBarHeight,
    this.progressBarWidth,
    this.progressBarPadding,
    this.onDismiss,
    this.isDismissable = true,
    this.dismissDirection = DismissDirection.horizontal,
    this.progressIndicatorBackground = greyColor,
    this.onNotificationPressed,
    this.animationCurve = Curves.ease,
    this.shadow,
    this.borderRadius,
    this.border,
  }) {
    _notificationType = NotificationType.success;
    progressIndicatorColor = _notificationType.color;
    checkAssertions();
  }

  ElegantNotification.error({
    super.key,
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
    this.icon,
    this.iconSize = defaultIconSize,
    this.position = Alignment.topRight,
    this.animation = AnimationType.fromRight,
    this.animationDuration = const Duration(milliseconds: 600),
    this.showProgressIndicator = true,
    this.action,
    this.verticalDividerColor = greyColor,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.progressBarHeight,
    this.progressBarWidth,
    this.progressBarPadding,
    this.onDismiss,
    this.isDismissable = true,
    this.dismissDirection = DismissDirection.horizontal,
    this.progressIndicatorBackground = greyColor,
    this.onNotificationPressed,
    this.animationCurve = Curves.ease,
    this.shadow,
    this.borderRadius,
    this.border,
  }) {
    _notificationType = NotificationType.error;
    progressIndicatorColor = _notificationType.color;
    checkAssertions();
  }

  ElegantNotification.info({
    super.key,
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
    this.icon,
    this.iconSize = defaultIconSize,
    this.position = Alignment.topRight,
    this.animation = AnimationType.fromRight,
    this.animationDuration = const Duration(milliseconds: 600),
    this.showProgressIndicator = true,
    this.action,
    this.verticalDividerColor = greyColor,
    this.autoDismiss = true,
    this.height,
    this.width,
    this.progressBarHeight,
    this.progressBarWidth,
    this.progressBarPadding,
    this.onDismiss,
    this.isDismissable = true,
    this.dismissDirection = DismissDirection.horizontal,
    this.progressIndicatorBackground = greyColor,
    this.onNotificationPressed,
    this.animationCurve = Curves.ease,
    this.shadow,
    this.borderRadius,
    this.border,
  }) {
    _notificationType = NotificationType.info;
    progressIndicatorColor = _notificationType.color;
    checkAssertions();
  }

  /// Checks assertions for various constructors of this package
  void checkAssertions() {
    if (showProgressIndicator) {
      assert(autoDismiss != false);
    }
    if (onNotificationPressed != null) {
      assert(
        action == null,
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

  /// The toast title widget
  final Widget? title;

  /// The toast description widget
  final Widget description;

  /// A secondary widget displayed under the description widget
  /// by default `action == null`
  final Widget? action;

  /// The color of the vertical divider between the icon and content
  /// By default it's null, which means it will use the default divider color = Color(0xffF3F3F3)
  /// You can customize the color by providing a specific [Color] value
  final Color verticalDividerColor;

  /// The notification icon, by default it's null.
  /// When it's null and using success, info and error the default icon is displayed
  /// When using the default constructor and icon is null nothing is rendered
  Widget? icon;

  /// The size of the icon, by default it's 20px.
  final double iconSize;

  /// The type of the animation set on the notification
  /// possible values
  /// ```dart
  /// {
  /// fromLeft,
  /// fromRight,
  /// fromTop,
  /// fromBottom,
  /// }
  /// ```
  /// default value `fromLeft`
  final AnimationType animation;

  /// The duration of the animation
  /// Default value `Duration(milliseconds: 600)`
  final Duration animationDuration;

  /// The toast animation curve by default the curve is set to [Curves.ease]
  final Curve animationCurve;

  /// The background color of the notification.
  /// By default it's set to white.
  /// For types constructors (Success, Info, Delete) this parameter is unchangeable.
  late Color background;

  /// The border radius of the notification widget
  final BorderRadius? borderRadius;

  /// The notification widget border
  final BoxBorder? border;

  /// How much the notification will take time,
  /// by default the duration is `3000 milliseconds`
  final Duration toastDuration;

  /// The notification shadow
  final BoxShadow? shadow;

  /// Enable or disable the progress indicator rendering.
  /// By default the indicator is displayed,
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable.
  late bool showProgressIndicator;

  /// The color of the progress.
  /// By default it's blue
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  late Color progressIndicatorColor;

  /// Progress bar indicator width, by default it's null so it takes the widget's width
  final double? progressBarWidth;

  /// Progress bar indicator height, by default it's null so it takes the widget's height
  final double? progressBarHeight;

  /// Progress bar indicator padding constraints
  final EdgeInsetsGeometry? progressBarPadding;

  /// The progress indicator background color
  /// by default it's grey
  final Color progressIndicatorBackground;

  /// Display or hide the close button
  /// by default the close button is displayed
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  ///
  final bool displayCloseButton;

  /// Close widget rendered as the close function
  /// by default the close button is displayed, if you don't want it set `closeButton` to null
  /// for types constructors (Success, Info, Delete) this parameter is unchangeable
  final Widget Function(void Function() dismissNotification)? closeButton;

  /// Function invoked when user press on the close button
  final void Function()? onCloseButtonPressed;

  /// Function invoked when the notification is closed after the finish of the progress indicator
  final void Function()? onProgressFinished;

  /// Function invoked when the user taps on the notification
  final void Function()? onNotificationPressed;

  /// Function invoked when tapping outside the notification
  /// Or when pressing the back button of the phone
  /// Or when tapping on the screen
  final Function()? onDismiss;

  /// Define whether the notification will be dismissed automatically or not
  /// By default `autoDimiss == false`
  final bool autoDismiss;

  /// The direction of the dismissible widget
  /// By default it's `DismissDirection.horizontal`
  final DismissDirection dismissDirection;

  /// The notification position in the screen
  /// By default the position is set to `Alignment.topRight`
  final Alignment position;

  /// The width of the notification widget
  final double? width;

  /// The height of the notification widget
  final double? height;

  /// If the notification is dismissible or not
  /// by default it's true
  final bool isDismissable;

  /// The margin between the notification and the edge of the screen
  final double notificationMargin;

  /// The options for the stacked mode
  final StackedOptions? stackedOptions;

  /// The type of the notification
  late NotificationType _notificationType;

  /// The timer for the notification
  late Timer _closeTimer;

  /// The offset animation for the notification
  late Animation<Offset> _offsetAnimation;

  /// The slide controller for the notification
  late AnimationController _slideController;

  final OverlayManager overlayManager = OverlayManager();
  OverlayEntry? overlayEntry;

  final Key uniqueKey = UniqueKey();
  late OverlayHelper overlayHelper;

  String get internalKey => stackedOptions != null
      ? '${stackedOptions?.key}%${uniqueKey.toString()}'
      : uniqueKey.toString();

  /// Display the notification on the screen
  /// [context] the context of the application
  void show(BuildContext context) {
    overlayHelper = OverlayHelper(
      height: height,
      width: width,
      notificationMargin: notificationMargin,
      position: position,
      context: context,
      stackedOptions: stackedOptions,
    );
    overlayEntry = _overlayEntryBuilder();
    final overlay = Overlay.maybeOf(context);
    if (overlay != null) {
      overlay.insert(overlayEntry!);
    } else {
      Navigator.of(context).overlay?.insert(overlayEntry!);
    }
    overlayManager.addOverlay(internalKey, overlayEntry!);
  }

  /// Close the notification overlay
  /// called when the user taps on the notification or when the notification is dismissed
  void closeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    overlayManager.removeOverlay(internalKey);
  }

  /// Dismiss the notification
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

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: overlayHelper.alignmentToLeftPos() +
              (stackedOptions?.itemOffset.dx ?? 0) *
                  (stackOverlaysLength - 1 - stackedItemPosition),
          top: overlayHelper.alignmentToTopPos() +
              overlayHelper.getTopPos(
                stackedItemPosition,
                stackOverlaysLength,
              ),
          child: AnimatedScale(
            duration: const Duration(
              milliseconds: 300,
            ),
            scale: overlayHelper.getScale(
              stackedItemPosition,
              stackOverlaysLength,
            ),
            alignment: Alignment.bottomCenter,
            child: Material(
              color: Colors.transparent,
              child: SafeArea(child: this),
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
            curve: widget.animationCurve,
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
            curve: widget.animationCurve,
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
            curve: widget.animationCurve,
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
            curve: widget.animationCurve,
          ),
        );
        break;
      default:
        widget._offsetAnimation = Tween<Offset>(
          begin: const Offset(-2, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: widget._slideController,
            curve: widget.animationCurve,
          ),
        );
        break;
    }

    ///  ! To support Flutter < 3.0.0
    ///  This allows a value of type T or T?
    ///  to be treated as a value of type T?.
    ///
    ///  We use this so that APIs that have become
    ///  non-nullable can still be used with `!` and `?`
    ///  to support older versions of the API as well.
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
        direction: widget.isDismissable
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
              borderRadius: widget.borderRadius ?? BorderRadius.circular(5.0),
              border: widget.border,
              color: widget.background,
              boxShadow: [
                widget.shadow ?? const BoxShadow(),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: ToastContent(
                    title: widget.title,
                    description: widget.description,
                    notificationType: widget._notificationType,
                    icon: widget.icon,
                    displayCloseButton: widget.onNotificationPressed == null
                        ? widget.displayCloseButton
                        : false,
                    closeButton: widget.closeButton,
                    onCloseButtonPressed: closeNotification,
                    iconSize: widget.iconSize,
                    action: widget.action,
                    verticalDividerColor: widget.verticalDividerColor,
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
