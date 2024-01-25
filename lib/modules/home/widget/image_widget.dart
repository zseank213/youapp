import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

class ImageWidget extends StatefulWidget {
  final ProfileCubit bloc;

  const ImageWidget({super.key, required this.bloc});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      width: double.infinity,
      height: 190,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.bloc.isEditing = true;
                  widget.bloc.heightAbout = widget.bloc.isEditing ? 450 : 0;
                });
              },
              child: Image.asset(
                editIcon,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@${widget.bloc.dataProfile?.data?.username}, ${widget.bloc.getAge()}",
                  style: textMedium(color: neutral30, isBold: true),
                ),
                AppDimens.verticalSpace6,
                Text(
                  "Male",
                  style: textNormal(color: neutral30),
                ),
                if (widget.bloc.dataProfile?.data?.birthday != null) ...[
                  AppDimens.verticalSpace12,
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          "${widget.bloc.dataProfile?.data?.horoscope}",
                          style: textNormal(color: neutral30),
                        ),
                      ),
                      AppDimens.horizontalSpace6,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          "${widget.bloc.dataProfile?.data?.zodiac}",
                          style: textNormal(color: neutral30),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
