import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

class CardWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final bool? isWhite;

  const CardWidget({
    super.key,
    this.height,
    this.child,
    this.width,
    this.isWhite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isWhite ?? false ? cardColor0 : cardColor1,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}
