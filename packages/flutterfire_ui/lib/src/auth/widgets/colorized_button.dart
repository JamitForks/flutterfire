import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action_card_container.dart';

class ColorizedButton extends StatelessWidget {
  const ColorizedButton({
    required this.text,
    required this.color,
    this.onTap,
    Key? key,
  })  : _isOutlineStyle = false,
        child = null,
        super(key: key);

  const ColorizedButton.outlined({
    required this.text,
    required this.color,
    this.onTap,
    Key? key,
  })  : _isOutlineStyle = true,
        child = null,
        super(key: key);

  const ColorizedButton.child({
    required this.child,
    required this.color,
    this.onTap,
    Key? key,
  })  : _isOutlineStyle = false,
        text = '',
        super(key: key);

  final VoidCallback? onTap;
  final String text;
  final Color color;
  final bool _isOutlineStyle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: ActionCardContainer(
        margin: EdgeInsets.zero,
        shadows: const <BoxShadow>[],
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 14, bottom: 12),
          decoration: BoxDecoration(
            color: _isOutlineStyle ? Colors.transparent : color,
            borderRadius: BorderRadius.circular(14),
            border: _isOutlineStyle
                ? Border.all(
                    color: color,
                    width: 1.5,
                  )
                : null,
          ),
          child: Center(
            child: child ??
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 24.0 / 20,
                    color: Colors.white,
                  ),
                ),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
