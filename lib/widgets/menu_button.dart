import 'package:flutter/material.dart';
import '../core/theme/app_color.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    this.onTap,
    required this.title,
    this.subTitle,
    this.bgColor,
  });

  final VoidCallback? onTap;
  final String title;
  final String? subTitle;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    final btnColor = onTap == null ? Colors.grey.shade500 : (bgColor ?? AppColor.blue);
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: btnColor,
            width: 2.5,
            strokeAlign: 6,
          ),
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
    );
  }
}
