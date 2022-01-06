import 'package:elegant_notification/resources/constants.dart';
import 'package:flutter/cupertino.dart';

extension TextExtension on Text {

  Text cloneTitle(){
    return Text(
      data ?? '',
      style: style ?? defaultTitleStyle,
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
      textScaleFactor:  textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

}