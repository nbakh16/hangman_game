import 'package:flutter/material.dart';
import 'widgets.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    this.onTap,
    required this.title,
    this.subTitle,
    this.gradientColor = const [],
  });

  final VoidCallback? onTap;
  final String title;
  final String? subTitle;
  final List<Color> gradientColor;

  @override
  Widget build(BuildContext context) {
    final btnGradientColor = onTap == null ? [Colors.grey.shade600, Colors.grey.shade500] : (gradientColor);

    const double borderRadius = 18;
    const double borderGap = 4;
    const double outerBorderRadius = borderRadius + borderGap;

    return ShrinkTapAnimation(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(outerBorderRadius),
          border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: btnGradientColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.88, 1],
            ),
            width: 2.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(borderGap),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: btnGradientColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.88, 1],
              ),
              borderRadius: BorderRadius.circular(borderRadius),
              // border: Border.all(
              //   color: gradientColor.first,
              //   style: BorderStyle.solid,
              //   width: 2.5,
              //   strokeAlign: 6,
              // ),
            ),
            child: SizedBox(
              height: 64,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 2,
                    children: [
                      FittedBox(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(letterSpacing: 1.75),
                        ),
                      ),
                      if (subTitle != null)
                        FittedBox(
                          child: Text(
                            subTitle!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
