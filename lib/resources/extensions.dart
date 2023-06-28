import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:flutter/material.dart';

extension NotificationPositionExtension on NotificationPosition {
  Alignment get alignment {
    switch (this) {
      case NotificationPosition.center:
        return Alignment.center;
      case NotificationPosition.centerRight:
        return Alignment.centerRight;
      case NotificationPosition.centerLeft:
        return Alignment.centerLeft;
      case NotificationPosition.topCenter:
        return Alignment.topCenter;
      case NotificationPosition.topRight:
        return Alignment.topRight;
      case NotificationPosition.topLeft:
        return Alignment.topLeft;
      case NotificationPosition.bottomCenter:
        return Alignment.bottomCenter;
      case NotificationPosition.bottomRight:
        return Alignment.bottomRight;
      case NotificationPosition.bottomLeft:
        return Alignment.bottomLeft;
      default:
        return Alignment.topCenter;
    }
  }
}

extension NotificationTypeExtension on NotificationType {
  Color color() {
    switch (this) {
      case NotificationType.success:
        return successColor;
      case NotificationType.error:
        return errorColor;
      case NotificationType.info:
        return inforColor;
      default:
        return Colors.blue;
    }
  }
}
