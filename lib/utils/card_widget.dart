import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const CardWidget({super.key, this.height, this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF152229),
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}
