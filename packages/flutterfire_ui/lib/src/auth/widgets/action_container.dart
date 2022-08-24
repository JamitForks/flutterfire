import 'package:flutter/material.dart';

class ActionContainer extends StatefulWidget {
  const ActionContainer({
    Key? key,
    required this.child,
    this.enabled = true,
    this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final bool enabled;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  State<StatefulWidget> createState() => _ActionContainer();
}

class _ActionContainer extends State<ActionContainer> {
  var _isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    var highlightOpacity = 0.0;
    Color highlightColor = widget.backgroundColor ?? Color(0xFF2C2C2C);
    if (widget.enabled && _isHighlighted) {
      highlightOpacity = 0.54;
    } else if (!widget.enabled) {
      highlightOpacity = 0.64;
      highlightColor = const Color(0xFF4D4D4D);
    }

    return Listener(
      behavior: HitTestBehavior.translucent,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (_) => setState(() => _isHighlighted = true),
        onTapUp: (_) => setState(() => _isHighlighted = false),
        onTapCancel: () => setState(() => _isHighlighted = false),
        child: IntrinsicHeight(
          child: IntrinsicWidth(
            child: Stack(
              children: [
                widget.child,
                AnimatedOpacity(
                  opacity: highlightOpacity,
                  duration: const Duration(milliseconds: 300),
                  child: Container(color: highlightColor),
                ),
              ],
            ),
          ),
        ),
        onTap: widget.onPressed,
      ),
    );
  }
}
