import 'resources_barrel.dart';

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
