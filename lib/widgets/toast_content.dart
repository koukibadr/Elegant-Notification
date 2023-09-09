import 'package:elegant_notification/gen/assets.gen.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/constants.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';

class ToastContent extends StatelessWidget {
  const ToastContent({
    Key? key,
    this.title,
    required this.description,
    required this.notificationType,
    required this.displayCloseButton,
    required this.onCloseButtonPressed,
    this.closeButton,
    this.icon,
    this.iconSize = 20,
    this.action,
    this.onActionPressed,
  }) : super(key: key);

  ///The title of the notification if any
  ///
  final Widget? title;

  ///The description of the notification text string
  ///
  final Widget description;

  ///The notification icon
  final Widget? icon;

  ///The icon size on pixels
  ///
  final double iconSize;

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
  final NotificationType notificationType;

  ///The function invoked when pressing the close button
  ///
  final void Function() onCloseButtonPressed;

  ///Display or hide the close button widget
  ///
  final bool displayCloseButton;

  ///Display or hide the close button widget
  final Widget Function(void Function() dismissNotification)? closeButton;

  ///Action widget rendered with clickable inkwell
  ///by default `action == null`
  final Widget? action;

  ///Function invoked when pressing `action` widget
  ///must be not null when `action != null`
  final Function()? onActionPressed;

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return Row(
      children: [
        Padding(
          padding: isRtl
              ? const EdgeInsets.only(right: horizontalComponentPadding)
              : const EdgeInsets.only(left: horizontalComponentPadding),
          child: _getNotificationIcon(),
        ),
        const SizedBox(
          width: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Container(
            width: 1,
            color: greyColor,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (title != null) ...[
                title!,
                const SizedBox(
                  height: 5,
                ),
              ],
              description,
              if (action != null) ...[
                const SizedBox(
                  height: 5,
                ),
                onActionPressed == null
                    ? action!
                    : InkWell(
                        onTap: onActionPressed,
                        child: action!,
                      ),
              ],
            ],
          ),
        ),
        Visibility(
          visible: displayCloseButton,
          child: closeButton?.call(onCloseButtonPressed) ??
              InkWell(
                onTap: () {
                  onCloseButtonPressed.call();
                },
                child: Padding(
                  padding: isRtl
                      ? const EdgeInsets.only(
                          top: verticalComponentPadding,
                          left: horizontalComponentPadding,
                        )
                      : const EdgeInsets.only(
                          top: verticalComponentPadding,
                          right: horizontalComponentPadding,
                        ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ],
    );
  }

  Widget _getNotificationIcon() {
    switch (notificationType) {
      case NotificationType.success:
        return _renderImage(Assets.icons.success.assetName);
      case NotificationType.error:
        return _renderImage(Assets.icons.error.assetName);
      case NotificationType.info:
        return _renderImage(Assets.icons.info.assetName);
      default:
        return icon!;
    }
  }

  Image _renderImage(String imageAsset) {
    return Image(
      image: AssetImage(
        imageAsset,
        package: packageName,
      ),
      width: iconSize,
    );
  }
}
