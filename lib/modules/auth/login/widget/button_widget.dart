import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final void Function() onTap;
  final bool? isDisable;
  final bool? hasShadow;
  final bool? isLoading;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading,
    this.hasShadow,
    this.isDisable,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Opacity(
        opacity: widget.isDisable ?? false ? 1 : 0.30,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          decoration: ShapeDecoration(
            gradient: gradientButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: [
              widget.hasShadow ?? true
                  ? BoxShadow(
                      color: const Color(0xFF4599DB).withOpacity(0.7),
                      spreadRadius: 1,
                      blurRadius: 9,
                      offset: const Offset(0, 5), // changes position of shadow
                    )
                  : const BoxShadow(),
            ],
          ),
          child: Center(
            child: widget.isLoading ?? false
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: circularProgressColor,
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    widget.text,
                    style: textMedium(color: neutral30, isBold: true),
                  ),
          ),
        ),
      ),
    );
  }
}
