import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/icons.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ToastContent extends StatelessWidget {
  final String title;
  final String description;
  final NOTIFICATION_TYPE notificationType;
  final Widget? icon;
  final bool displayCloseButton;

  ToastContent(
      {required this.title,
      required this.description,
      required this.notificationType,
      required this.displayCloseButton,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image(
              image: AssetImage(SUCCESS_ICON, package: PACKAGE_NAME),
              width: 20,
            ),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    width: 170,
                    child: Text(
                      this.description,
                      style: TextStyle(fontSize: 12),
                    )),
              ],
            ),
          ),
          Visibility(
            visible: this.displayCloseButton,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.close, color: Colors.grey, size: 15),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
