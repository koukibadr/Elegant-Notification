import 'package:elegant_notification/gen/assets.gen.dart';
import 'resources_barrel.dart';

abstract class _IconsSkeleton {
  Widget drawCustomIcons({
    required String assetName,
    required BuildContext context,
  });
}

class _InfoIcon implements _IconsSkeleton {
  @override
  Widget drawCustomIcons({
    required String assetName,
    required BuildContext context,
  }) {
    return Image.asset(
      assetName,
      width: MediaQueryData.fromView(View.of(context)).size.width * 0.12,
      height: MediaQueryData.fromView(View.of(context)).size.height * 0.12,
      package: packageName,
    );
  }
}

class _ErrorIcon implements _IconsSkeleton {
  @override
  Widget drawCustomIcons({
    required String assetName,
    required BuildContext context,
  }) {
    return Image.asset(
      assetName,
      width: MediaQueryData.fromView(View.of(context)).size.width * 0.12,
      height: MediaQueryData.fromView(View.of(context)).size.height * 0.12,
      package: packageName,
    );
  }
}

class _SuccessIcon implements _IconsSkeleton {
  @override
  Widget drawCustomIcons({
    required String assetName,
    required BuildContext context,
  }) {
    return Image.asset(
      assetName,
      width: MediaQueryData.fromView(View.of(context)).size.width * 0.12,
      height: MediaQueryData.fromView(View.of(context)).size.height * 0.12,
      package: packageName,
    );
  }
}

class IconsFactory {
  static Widget drawIcons(NotificationType type, BuildContext cxt) {
    switch (type) {
      case NotificationType.success:
        return _SuccessIcon().drawCustomIcons(
          assetName: Assets.icons.success.assetName,
          context: cxt,
        );
      case NotificationType.error:
        return _ErrorIcon().drawCustomIcons(
          assetName: Assets.icons.error.assetName,
          context: cxt,
        );
      case NotificationType.info:
        return _InfoIcon().drawCustomIcons(
          assetName: Assets.icons.info.assetName,
          context: cxt,
        );
      default:
        return const Placeholder();
    }
  }
}
