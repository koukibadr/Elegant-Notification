import 'package:flutter/material.dart';

extension AlignementExtension on Alignment {
  bool get fromTop {
    return [
      Alignment.topCenter,
      Alignment.topLeft,
      Alignment.topRight,
    ].contains(this);
  }
}
