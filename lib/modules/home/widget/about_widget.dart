import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:youapp/lib.dart';

class AboutWidget extends StatefulWidget {
  final ProfileCubit bloc;

  const AboutWidget({super.key, required this.bloc});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  Widget renderEditing() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          AppDimens.verticalSpace30,
          Row(
            children: [
              Container(
                height: 57,
                width: 57,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: textColor1,
                  ),
                ),
              ),
              AppDimens.horizontalSpace14,
              Text(
                "Add Image",
                style: textSmall(color: textColor0),
              ),
            ],
          ),
          AppDimens.verticalSpace12,
          TitleDetailFormWidget(
            title: 'Display Name:',
            hintText: "Display Name",
            controller: widget.bloc.displayNameController,
          ),
          const TitleDetailFormWidget(
            title: 'Gender:',
            hintText: "Gender",
            initialValue: "Male",
          ),
          TitleDetailFormWidget(
            title: 'Birthday:',
            hintText: "DD MM YYYY",
            isDisable: true,
            controller: widget.bloc.birthdayController,
            onTap: () {
              DatePicker.showDatePicker(
                context,
                maxTime: DateTime.now(),
                currentTime: widget.bloc.dateSelected,
                onConfirm: (value) {
                  setState(() {
                    widget.bloc.birthdayController.text = DateFormat("dd/MM/yyyy").format(value);
                    widget.bloc.horoscopeController.text = widget.bloc.getZodiacSign(value);
                    widget.bloc.dateSelected = value;
                  });
                },
              );
            },
          ),
          TitleDetailFormWidget(
            title: 'Horoscope:',
            hintText: "--",
            controller: widget.bloc.horoscopeController,
            isDisable: true,
          ),
          TitleDetailFormWidget(
            title: 'Zodiac:',
            hintText: "--",
            controller: widget.bloc.zodiacController,
            isDisable: true,
          ),
          TitleDetailFormWidget(
            title: 'Height:',
            hintText: "Add Height",
            controller: widget.bloc.heightController,
            isNumber: true,
          ),
          TitleDetailFormWidget(
            title: 'Weight:',
            hintText: "Add Weight",
            controller: widget.bloc.weightController,
            isNumber: true,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "About",
                style: textMedium(color: neutral30, isBold: true),
              ),
              InkWell(
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  if (widget.bloc.isEditing) {
                    await widget.bloc.createProfile().then((value) {
                      setState(() {});
                    });
                  }
                  setState(() {
                    widget.bloc.isEditing = !widget.bloc.isEditing;
                    widget.bloc.heightAbout = widget.bloc.isEditing ? 520 : 0;
                  });
                },
                child: widget.bloc.isEditing
                    ? Text(
                        "Save & Update",
                        style: textNormal(color: textColor1),
                      )
                    : Image.asset(
                        editIcon,
                      ),
              ),
            ],
          ),
          AnimatedContainer(
            height: widget.bloc.heightAbout,
            duration: const Duration(milliseconds: 750),
            curve: Curves.fastOutSlowIn,
            child: renderEditing(),
          ),
          if (widget.bloc.dataProfile?.data?.birthday != null && !widget.bloc.isEditing) ...[
            AppDimens.verticalSpace24,
            TitleDetailWidget(
              title: 'Birthday',
              detail: '${widget.bloc.dataProfile?.data?.birthday} (Age ${widget.bloc.getAge()})',
            ),
            TitleDetailWidget(
              title: 'Horoscope',
              detail: '${widget.bloc.dataProfile?.data?.horoscope}',
            ),
            TitleDetailWidget(
              title: 'Zodiac',
              detail: '${widget.bloc.dataProfile?.data?.zodiac}',
            ),
            TitleDetailWidget(
              title: 'Height',
              detail: '${widget.bloc.dataProfile?.data?.height} cm',
            ),
            TitleDetailWidget(
              title: 'Weight',
              detail: '${widget.bloc.dataProfile?.data?.weight} kg',
            ),
          ] else ...[
            if (widget.bloc.isEditing == false) ...[
              AppDimens.verticalSpace24,
              Text(
                "Add in your your to help others know you better",
                style: textNormal(color: textColor0.withOpacity(0.5)),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
