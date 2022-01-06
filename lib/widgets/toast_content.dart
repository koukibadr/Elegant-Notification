import 'package:elegant_notification/gen/assets.gen.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/constants.dart';
import 'package:elegant_notification/resources/dimens.dart';
import 'package:elegant_notification/resources/extensions.dart';
import 'package:flutter/material.dart';
import '../resources/colors.dart';

class ToastContent extends StatelessWidget {
  const ToastContent({
    Key? key,
    this.title,
    required this.description,
    required this.notificationType,
    required this.displayCloseButton,
    this.icon,
    this.onCloseButtonPressed,
    this.iconSize = defaultIconSize,
  }) : super(key: key);

  ///The title of the notification if any
  ///
  final Text? title;

  ///The description of the notification text string
  ///
  final Text description;

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
  final NOTIFICATION_TYPE notificationType;

  ///Display or hide the close button widget
  ///
  final bool displayCloseButton;

  ///The function invoked when pressing the close button
  ///
  final Function? onCloseButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
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
                title!.cloneTitle(),
                const SizedBox(
                  height: 5,
                ),
              ],
              description,
            ],
          ),
        ),
        Visibility(
          visible: displayCloseButton,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              onCloseButtonPressed?.call();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 10,
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
        )
      ],
    );
  }

  Widget _getNotificationIcon() {
    switch (notificationType) {
      case NOTIFICATION_TYPE.success:
        return _renderImage(Assets.icons.success.assetName);
      case NOTIFICATION_TYPE.error:
        return _renderImage(Assets.icons.error.assetName);
      case NOTIFICATION_TYPE.info:
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
