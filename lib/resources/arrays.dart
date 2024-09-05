import 'package:elegant_notification/resources/colors.dart';
import 'package:flutter/material.dart';

enum NotificationType {
  success(
    color: successColor,
  ),
  error(
    color: errorColor,
  ),
  info(
    color: infoColor,
  ),
  custom(
    color: Colors.blue,
  );

  final Color color;
  const NotificationType({
    required this.color,
  });
}

enum AnimationType {
  fromLeft,
  fromRight,
  fromTop,
  fromBottom,
}
