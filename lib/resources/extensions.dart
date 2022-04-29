import 'package:elegant_notification/resources/constants.dart';
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
