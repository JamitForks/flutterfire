import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action_container.dart';

class ActionCardContainer extends StatelessWidget {
  const ActionCardContainer({
    Key? key,
    required this.child,
    this.enabled = true,
    this.margin = const EdgeInsets.all(8),
    this.shadows = const <BoxShadow>[
      BoxShadow(
        color: Color(0x3D000000),
        spreadRadius: 0,
        blurRadius: 16,
        offset: Offset(0, 6),
      ),
    ],
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final bool enabled;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final VoidCallback? onPressed;
  final List<BoxShadow> shadows;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: shadows,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: AbsorbPointer(
          absorbing: onPressed == null,
          child: ActionContainer(
            child: child,
            onPressed: onPressed,
            backgroundColor: backgroundColor,
          ),
        ),
      ),
    );
  }
}
