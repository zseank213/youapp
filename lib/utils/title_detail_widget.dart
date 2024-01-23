import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

class TitleDetailWidget extends StatelessWidget {
  final String title;
  final String detail;

  const TitleDetailWidget({super.key, required this.title, required this.detail});

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
