import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

class TitleDetailWidget extends StatelessWidget {
  final String title;
  final String detail;

  const TitleDetailWidget({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$title :",
              style: textNormal(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
            Text(
              " $detail",
              style: textNormal(color: neutral30),
            ),
          ],
        ),
        AppDimens.verticalSpace12,
      ],
    );
  }
}

class TitleDetailFormWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final String? initialValue;
  final void Function()? onTap;
  final bool? isDisable;
  final bool? isNumber;
  final TextEditingController? controller;

  const TitleDetailFormWidget({
    super.key,
    required this.title,
    required this.hintText,
    this.initialValue,
    this.onTap,
    this.isDisable,
    this.isNumber,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "$title :",
                style: textNormal(
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: TextFormField(
                initialValue: initialValue,
                controller: controller,
                style: textNormal(color: textColor0),
                onTap: onTap,
                readOnly: isDisable ?? false,
                textAlign: TextAlign.right,
                keyboardType: isNumber == true ? TextInputType.number : TextInputType.text,
                decoration: textInputDecoration(
                  isFilled: true,
                  hintText: hintText,
                  fillColor: Colors.white.withOpacity(0.1),
                  colorBorder: Colors.transparent,
                  enableColorBorder: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
        AppDimens.verticalSpace12,
      ],
    );
  }
}
