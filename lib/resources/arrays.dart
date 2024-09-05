import 'package:elegant_notification/resources/colors.dart';
import 'package:flutter/material.dart';

enum NotificationType {
  success(
    color: successColor,
    icon: Icons.check_circle,
  ),
  error(
    color: errorColor,
    icon: Icons.close,
  ),
  info(
    color: infoColor,
    icon: Icons.info,
  ),
  custom(
    color: Colors.blue,
  );

  final Color color;
  final IconData? icon;

  const NotificationType({
    required this.color,
    this.icon,
  });
}

enum AnimationType {
  fromLeft,
  fromRight,
  fromTop,
  fromBottom,
}
