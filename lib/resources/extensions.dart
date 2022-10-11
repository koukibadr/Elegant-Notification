import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/cupertino.dart';

extension TextExtension on Text {
  Text cloneTitle() {
    return Text(
      data ?? '',
      style: style ??
          const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      key: key,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text cloneDescription() {
    return Text(
      data ?? '',
      style: style ??
          const TextStyle(
            fontSize: 12,
          ),
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      key: key,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}

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
