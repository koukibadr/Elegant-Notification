import 'package:elegant_notification/resources/colors.dart';
import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  final Color foregroundColor;
  final int duration;
  double value = 0;

  AnimatedProgressBar({
    Key? key,
    required this.foregroundColor ,
    required this.duration,
  }) : super(key: key);

  @override
  _AnimatedProgressBarState createState() {
    return _AnimatedProgressBarState();
  }
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> curve;
  late Tween<double> valueTween;

  late double value = widget.value;

  @override
  void initState() {
    super.initState();

    this._controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );

    this.curve = CurvedAnimation(
      parent: this._controller,
      curve: Curves.easeInOut,
    );

    this.valueTween = Tween<double>(
      begin: 1,
      end: 0,
    );

    this._controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (this.widget.value != oldWidget.value) {
      double beginValue = this.valueTween.evaluate(this.curve);
      this.valueTween = Tween<double>(
        begin: beginValue,
        end: this.widget.value,
      );

      this._controller
        ..value = 0
        ..forward();
    }
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: this.curve,
      builder: (context, child) {
        return LinearProgressIndicator(
          backgroundColor: GREY_COLOR,
          valueColor: AlwaysStoppedAnimation(widget.foregroundColor),
          value: this.valueTween.evaluate(this.curve),
        );
      },
    );
  }
}
