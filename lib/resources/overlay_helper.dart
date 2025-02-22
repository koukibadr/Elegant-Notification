import 'dart:ui';

import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/widgets.dart';

abstract class OverlayHelper {
  factory OverlayHelper({
    double? height,
    double? width,
    required double notificationMargin,
    required Alignment position,
    required BuildContext context,
    required StackedOptions? stackedOptions,
  }) =>
      _OverlayHelper(
        height: height,
        width: width,
        notificationMargin: notificationMargin,
        position: position,
        context: context,
        stackedOptions: stackedOptions,
      );

  /// Returns the top position of the overlay
  double alignmentToTopPos();

  // Returns the top position padding of the overlay
  double getTopPos(int stackedItemPosition, int stackOverlaysLength);

  /// Returns the left position of the overlay
  double alignmentToLeftPos();

  /// Returns the height of the main container
  double mainContainerHeight();

  /// Returns the width of the main container
  double mainContainerWidth();

  /// Returns the scale of the overlay
  double getScale(int stackedItemPosition, int stackOverlaysLength);
}

class _OverlayHelper implements OverlayHelper {
  _OverlayHelper({
    this.height,
    this.width,
    this.notificationMargin = 0,
    required this.position,
    required this.context,
    this.stackedOptions,
  });

  final double? height;
  final double? width;
  final double notificationMargin;
  final Alignment position;
  final BuildContext context;
  final StackedOptions? stackedOptions;

  @override
  double alignmentToTopPos() {
    if (position.y == 1) {
      return MediaQuery.of(context).size.height -
          mainContainerHeight() -
          notificationMargin;
    } else if (position.y == -1) {
      return notificationMargin;
    } else {
      return ((position.y + 1) / 2) * MediaQuery.of(context).size.height -
          (mainContainerHeight() / 2);
    }
  }

  @override
  double mainContainerHeight() =>
      height ?? MediaQuery.of(context).size.height * 0.12;

  @override
  double mainContainerWidth() =>
      width ?? MediaQuery.of(context).size.width * 0.7;

  @override
  double getTopPos(int stackedItemPosition, int stackOverlaysLength) {
    if (stackedOptions?.type == StackedType.above) {
      return -(mainContainerHeight() * stackedItemPosition) +
          (stackedOptions?.itemOffset.dy ?? 0) * stackedItemPosition;
    } else if (stackedOptions?.type == StackedType.below) {
      return (mainContainerHeight() * stackedItemPosition) +
          (stackedOptions?.itemOffset.dy ?? 0) * stackedItemPosition;
    } else {
      return (stackedOptions?.itemOffset.dy ?? 0) *
          (stackOverlaysLength - 1 - stackedItemPosition);
    }
  }

  @override
  double alignmentToLeftPos() {
    if (position.x == 1) {
      return MediaQuery.of(context).size.width -
          mainContainerWidth() -
          notificationMargin;
    } else if (position.x == -1) {
      return notificationMargin;
    } else {
      return ((position.x + 1) / 2) * MediaQuery.of(context).size.width -
          (mainContainerWidth() / 2);
    }
  }

  @override
  double getScale(int stackedItemPosition, int stackOverlaysLength) {
    if (stackedOptions?.scaleFactor != null) {
      return clampDouble(
        (1 -
            (stackedOptions?.scaleFactor ?? 0) *
                (stackOverlaysLength - (stackedItemPosition + 1))),
        0,
        1,
      );
    } else {
      return 1.0;
    }
  }
}
