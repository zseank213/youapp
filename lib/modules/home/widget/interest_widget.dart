import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

class InterestWidget extends StatefulWidget {
  final ProfileCubit bloc;

  const InterestWidget({super.key, required this.bloc});

  @override
  State<InterestWidget> createState() => _InterestWidgetState();
}

class _InterestWidgetState extends State<InterestWidget> {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Interest",
                style: textNormal(color: neutral30, isBold: true),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    SmoothAnimationRoute(
                      InterestScreen(
                        data: widget.bloc.dataProfile ?? ProfileModel(),
                        callback: (value) {
                          setState(() {
                            widget.bloc.dataProfile?.data?.interests = value;
                          });
                        },
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  editIcon,
                ),
              ),
            ],
          ),
          AppDimens.verticalSpace16,
          if (widget.bloc.dataProfile?.data?.interests?.isNotEmpty ?? true) ...[
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                widget.bloc.dataProfile?.data?.interests?.length ?? 0,
                (index) => Container(
                  height: 33,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    widget.bloc.dataProfile?.data?.interests?[index] ?? '',
                    style: textNormal(color: neutral30, isBold: true),
                  ),
                ),
              ),
            ),
          ] else ...[
            Center(
              child: Text(
                "Add in your interest to find a better match",
                style: textNormal(
                  color: Colors.white.withOpacity(0.5199999809265137),
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
