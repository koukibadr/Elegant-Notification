import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/dimens.dart';
import 'package:elegant_notification/resources/icons.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ToastContent extends StatelessWidget {
  ToastContent(
      {required this.title,
      required this.description,
      required this.notificationType,
      required this.displayCloseButton,
      required this.titleStyle,
      required this.descriptionStyle,
      this.icon,
      this.onCloseButtonPressed,
      this.iconSize = DEFAULT_ICON_SIZE});


  ///The title of the notification
  ///
  final String title;
  
  ///The title text style
  ///
  final TextStyle titleStyle;

  ///The description of the notification text string
  ///
  final String description;

  /// The description text style
  /// 
  final TextStyle descriptionStyle;

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
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: _getNotificationIcon(),
          ),
          SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              width: 1,
              color: GREY_COLOR,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  this.title,
                  style: this.titleStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    child:
                        Text(this.description, style: this.descriptionStyle)),
              ],
            ),
          ),
          Visibility(
            visible: this.displayCloseButton,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                this.onCloseButtonPressed?.call();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.close, color: Colors.grey, size: 15),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getNotificationIcon() {
    switch (this.notificationType) {
      case NOTIFICATION_TYPE.SUCCESS:
        return _renderImage(SUCCESS_ICON);
      case NOTIFICATION_TYPE.ERROR:
        return _renderImage(ERROR_ICON);
      case NOTIFICATION_TYPE.INFO:
        return _renderImage(INFO_ICON);
      default:
        return this.icon!;
    }
  }

  Image _renderImage(String imageAsset) {
    return Image(
      image: AssetImage(imageAsset, package: PACKAGE_NAME),
      width: this.iconSize,
    );
  }
}
