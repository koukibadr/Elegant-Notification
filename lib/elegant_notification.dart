import 'package:elegant_notification/resources/toast_content.dart';
import 'package:flutter/material.dart';

class ElegantNotification extends StatefulWidget {
  final Color shadowColor;
  final Color background;
  final double radius;
  final bool enableShadow;

  ElegantNotification(
      {this.shadowColor = Colors.grey,
      this.background = Colors.white,
      this.radius = 5,
      this.enableShadow = true});

  show(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, _, __) => AlertDialog(
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.all(0),
                insetPadding: EdgeInsets.all(70),
                elevation: 0,
                content: this,
              ),
          opaque: false),
    );
  }

  @override
  _ElegantNotificationState createState() => _ElegantNotificationState();
}

class _ElegantNotificationState extends State<ElegantNotification> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 400,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(this.widget.radius),
            color: this.widget.background,
            boxShadow: this.widget.enableShadow
                ? [
                    BoxShadow(
                      color: this.widget.shadowColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]
                : null,
          ),
          child: Column(
            children: [
              Expanded(child: ToastContent()),
              LinearProgressIndicator(value: 40)
            ],
          ),
        ),
      ],
    );
  }
}
