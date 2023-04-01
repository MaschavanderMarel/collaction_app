import 'package:flutter/material.dart';

import '../themes/constants.dart';

class CustomFAB extends StatelessWidget {
  final Widget child;
  final bool isMini;
  final String? heroTag;
  final GestureTapCallback? onPressed;
  final Color? color;
  final double? elevation;

  const CustomFAB(
      {super.key,
      required this.child,
      this.isMini = false,
      this.heroTag = "fabBtn",
      this.onPressed,
      this.color,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      heroTag: heroTag,
      backgroundColor:
          color ?? (onPressed != null ? kAccentColor : kDisabledButtonColor),
      mini: isMini,
      child: child,
      elevation: elevation ?? 6,
    );
  }
}
