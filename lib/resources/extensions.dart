import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:flutter/material.dart';

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

extension AlignementExtension on Alignment {
  bool get fromTop {
    return [
      Alignment.topCenter,
      Alignment.topLeft,
      Alignment.topRight,
    ].contains(this);
  }
}
