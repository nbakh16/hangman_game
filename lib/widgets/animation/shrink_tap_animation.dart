import 'package:flutter/material.dart';

class ShrinkTapAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  const ShrinkTapAnimation({super.key, required this.child, this.onTap});

  @override
  State<ShrinkTapAnimation> createState() => _ShrinkTapAnimationState();
}

class _ShrinkTapAnimationState extends State<ShrinkTapAnimation> with SingleTickerProviderStateMixin {
  static const clickAnimationDurationMillis = 100;

  double _scaleTransformValue = 1;

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: clickAnimationDurationMillis),
          lowerBound: 0.0,
          upperBound: 0.05,
        )..addListener(() {
          setState(() => _scaleTransformValue = 1 - animationController.value);
        });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _shrinkButtonSize() {
    animationController.forward();
  }

  void _restoreButtonSize() {
    Future.delayed(
      const Duration(milliseconds: clickAnimationDurationMillis),
      () => animationController.reverse(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap == null
          ? null
          : () {
              widget.onTap?.call();
              _shrinkButtonSize();
              _restoreButtonSize();
            },
      onTapDown: (_) => widget.onTap == null ? null : _shrinkButtonSize(),
      onTapCancel: widget.onTap == null ? null : _restoreButtonSize,
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: widget.child,
      ),
    );
  }
}
