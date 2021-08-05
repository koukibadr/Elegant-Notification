import 'package:elegant_notification/resources/icons.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ToastContent extends StatelessWidget {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Check Your input",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 170,
                  child: Text(
                    "Please keep in mind to check your information before sending your request",
                    style: TextStyle(fontSize: 12),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
