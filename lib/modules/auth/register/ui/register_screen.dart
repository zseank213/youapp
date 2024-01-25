import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:youapp/lib.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final bloc = RegisterCubit();

  Widget renderButton(BuildContext context, bool isNotEmpty) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (cRegister, sRegister) {
          if (sRegister is OnSuccessRegister) {
            Fluttertoast.showToast(
              msg: '${sRegister.data?.message}',
              textColor: textColor0,
              backgroundColor: backgroundColors1,
            );
            Navigator.pushReplacementNamed(context, routeLogin);
          }
          if (sRegister is OnErrorRegister) {
            Fluttertoast.showToast(
              msg: '${sRegister.errorMessage}',
              textColor: textColor0,
              backgroundColor: errorTextColor.withOpacity(0.5),
            );
          }
        },
        child: ButtonWidget(
          text: "Register",
          isDisable: isNotEmpty,
          isLoading: bloc.isLoading,
          onTap: () {
            if (bloc.formKey.currentState!.validate()) {
              FocusScope.of(context).unfocus();
              bloc.post();
            }
          },
        ),
      ),
    );
  }

  Widget renderLoginButton() {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Have account? ',
              style: textNormal(color: textColor0),
            ),
            TextSpan(
              text: 'Login here',
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushReplacementNamed(context, routeLogin),
              style: textNormal(color: textColor1, isUnderline: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderForm() {
    return Column(
      children: [
        tittleAndTextField(
          controller: bloc.emailController,
          style: textNormal(color: neutral30),
          decoration: textInputDecoration(
            isFilled: true,
            hintText: "Enter Email",
            fillColor: Colors.white.withOpacity(0.1),
            colorBorder: Colors.transparent,
            enableColorBorder: Colors.transparent,
          ),
          onChange: (value) {
            setState(() {});
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Email must be filled out !";
            } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
              return "Email is invalid !";
            }
            return null;
          },
        ),
        tittleAndTextField(
          controller: bloc.usernameController,
          style: textNormal(color: neutral30),
          decoration: textInputDecoration(
            isFilled: true,
            hintText: "Create Username",
            fillColor: Colors.white.withOpacity(0.1),
            colorBorder: Colors.transparent,
            enableColorBorder: Colors.transparent,
          ),
          onChange: (value) {
            setState(() {});
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Username must be filled out !";
            }
          },
        ),
        tittleAndTextField(
          controller: bloc.passwordController,
          isPassword: bloc.isPassword,
          style: textNormal(color: neutral30),
          decoration: textInputDecoration(
            isFilled: true,
            hintText: "Create Password",
            fillColor: Colors.white.withOpacity(0.1),
            colorBorder: Colors.transparent,
            enableColorBorder: Colors.transparent,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  bloc.isPassword = !bloc.isPassword;
                });
              },
              child: Image.asset(
                removeEyeIcon,
              ),
            ),
          ),
          onChange: (value) {
            setState(() {});
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Password must be filled out !";
            } else if (value.length < 8) {
              return "Password must be longer than or equal to 8 characters !";
            }
            return null;
          },
        ),
        tittleAndTextField(
          controller: bloc.confirmPasswordController,
          isPassword: bloc.isPassword,
          style: textNormal(color: neutral30),
          decoration: textInputDecoration(
            isFilled: true,
            hintText: "Confirm Password",
            fillColor: Colors.white.withOpacity(0.1),
            colorBorder: Colors.transparent,
            enableColorBorder: Colors.transparent,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  bloc.isPassword = !bloc.isPassword;
                });
              },
              child: Image.asset(
                removeEyeIcon,
              ),
            ),
          ),
          onChange: (value) {
            setState(() {});
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Confirm Password must be filled out !";
            } else if (value.length < 8) {
              return "Password must be longer than or equal to 8 characters !";
            } else if (value != bloc.passwordController.text) {
              return "Password not same !";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget renderScreen(BuildContext context, bool isNotEmpty) {
    return Form(
      key: bloc.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppDimens.horizontalSpace12,
              Text(
                "Register",
                style: textXXL(color: neutral30, isBold: true),
              ),
            ],
          ),
          AppDimens.verticalSpace18,
          renderForm(),
          AppDimens.verticalSpace12,
          renderButton(context, isNotEmpty),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isNotEmpty = bloc.emailController.text.isNotEmpty &&
        bloc.usernameController.text.isNotEmpty &&
        bloc.passwordController.text.isNotEmpty &&
        bloc.confirmPasswordController.text.isNotEmpty;

    return ContainerForm(
      body: renderScreen(context, isNotEmpty),
      bottom: renderLoginButton(),
    );
  }
}
