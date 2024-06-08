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
  }) : super(key: key);

  final Widget? title;
  final Widget description;
  final Widget? icon;
  final double iconSize;
  final NotificationType notificationType;
  final void Function() onCloseButtonPressed;
  final bool displayCloseButton;
  final Widget Function(void Function() dismissNotification)? closeButton;
  final Widget? action;

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
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
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
                action!,
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
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
        return Icon(
          Icons.check_circle,
          color: successColor,
          size: iconSize,
        );
      case NotificationType.error:
        return Transform.rotate(
          angle: 1,
          child: Icon(
            Icons.add_circle_outlined,
            color: errorColor,
            size: iconSize,
          ),
        );
      case NotificationType.info:
        return Icon(
          Icons.info,
          color: inforColor,
          size: iconSize,
        );
      default:
        return icon!;
    }
  }
}
