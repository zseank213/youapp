import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youapp/lib.dart';

Widget tittleAndTextField({
  TextEditingController? controller,
  TextStyle? style,
  String? hintText,
  String? initialValue,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatter,
  void Function()? onTap,
  void Function(String)? onChange,
  bool? isDisable,
  bool? isNumber,
  bool? isEmail,
  bool? isPassword,
  bool? isFilled,
  bool? isDescription,
  InputDecoration? decoration,
  TextStyle? textTitleStyle,
  Color? fillColor,
  Color? borderColor,
  Color? enableColorBorder,
  FocusNode? focusNode,
  TextInputAction? textInputAction,
  TextInputType? textInputType,
  TextAlign? textAlign,
  bool? bottomSpace,
  Widget help = const Text(''),
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
        focusNode: focusNode,
        textInputAction: textInputAction,
        obscureText: isPassword ?? false,
        initialValue: initialValue,
        onTap: onTap,
        maxLines: isDescription == true ? 10 : 1,
        minLines: isDescription == true ? 3 : 1,
        onChanged: onChange,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          if (isNumber ?? false) FilteringTextInputFormatter.digitsOnly,
          ...?inputFormatter
        ],
        style: style ?? textFieldStyle(),
        controller: controller,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: isNumber == true
            ? TextInputType.number
            : isEmail == true
                ? TextInputType.emailAddress
                : textInputType ?? TextInputType.text,
        readOnly: isDisable ?? false,
        decoration: decoration ??
            textInputDecoration(
              isFilled: isFilled,
              hintText: hintText,
              fillColor: fillColor,
              colorBorder: borderColor,
              enableColorBorder: enableColorBorder,
            ),
        validator: validator,
      ),
      if (bottomSpace ?? true == true) AppDimens.verticalSpace12,
    ],
  );
}
