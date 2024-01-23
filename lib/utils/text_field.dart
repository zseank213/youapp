import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youapp/lib.dart';

Widget tittleAndTextField({
  String? tittle,
  TextEditingController? controller,
  TextStyle? style,
  bool? haveTittle,
  String? hintText,
  String? helperText,
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
      if (haveTittle ?? true && tittle != null) ...[
        Row(
          children: [
            Text(
              tittle ?? '',
              style: textTitleStyle ?? textSmall(color: neutral90),
            ),
            AppDimens.horizontalSpace6,
            help,
          ],
        ),
        AppDimens.verticalSpace4,
      ],
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
              helperText: helperText,
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

Widget tittleAndTextFieldSuffix({
  required String tittle,
  required TextEditingController controller,
  String? hintText,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatter,
  void Function()? onTap,
  void Function(String)? onChange,
  Widget? suffixIcon,
  bool? isDisable,
  bool? isNumber,
  bool? isEmail,
  bool isPassword = false,
  bool? isFilled,
  InputDecoration? decoration,
  TextStyle? textTitleStyle,
  Color? borderColor,
  Color? enableColorBorder,
  Color? fillColor,
  TextInputAction? textInputAction,
  bool? bottomSpace,
  Widget help = const Text(''),
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            tittle,
            style: textTitleStyle ?? textSmall(color: neutral90),
          ),
          AppDimens.horizontalSpace6,
          help,
        ],
      ),
      AppDimens.verticalSpace6,
      TextFormField(
        textInputAction: textInputAction,
        onTap: onTap,
        onChanged: onChange,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatter,
        obscureText: isPassword,
        style: textFieldStyle(),
        controller: controller,
        keyboardType: isNumber == true
            ? TextInputType.number
            : isEmail == true
                ? TextInputType.emailAddress
                : TextInputType.name,
        readOnly: isDisable ?? false,
        decoration: decoration ??
            textInputDecoration(
              isFilled: isFilled,
              hintText: hintText,
              fillColor: fillColor,
              colorBorder: borderColor,
              suffixIcon: suffixIcon,
              enableColorBorder: enableColorBorder,
            ),
        validator: validator,
      ),
      if (bottomSpace ?? true == true) AppDimens.verticalSpace12,
    ],
  );
}

Widget tittleAndTextFieldPrefix({
  required String tittle,
  required TextEditingController controller,
  String? hintText,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatter,
  void Function()? onTap,
  void Function(String)? onChange,
  Widget? prefixIcon,
  bool? isDisable,
  bool? isNumber,
  bool? isEmail,
  bool isPassword = false,
  bool? isFilled,
  InputDecoration? decoration,
  TextStyle? textTitleStyle,
  Color? borderColor,
  Color? enableColorBorder,
  Color? fillColor,
  TextInputAction? textInputAction,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tittle,
        style: textTitleStyle ?? textSmall(color: neutral90),
      ),
      AppDimens.verticalSpace6,
      TextFormField(
        textInputAction: textInputAction,
        onTap: onTap,
        onChanged: onChange,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatter,
        obscureText: isPassword,
        style: textFieldStyle(),
        controller: controller,
        keyboardType: isNumber == true
            ? TextInputType.number
            : isEmail == true
                ? TextInputType.emailAddress
                : TextInputType.name,
        readOnly: isDisable ?? false,
        decoration: decoration ??
            textInputDecoration(
              isFilled: isFilled,
              hintText: hintText,
              fillColor: fillColor,
              colorBorder: borderColor,
              prefixIcon: prefixIcon,
              enableColorBorder: enableColorBorder,
            ),
        validator: validator,
      ),
      AppDimens.verticalSpace12,
    ],
  );
}
