import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final bloc = RegisterCubit();

  Widget renderButton(BuildContext context) {
    return ButtonWidget(
      text: "Register",
      isDisable: bloc.formKey.currentState?.validate() ?? false,
      onTap: () {
        if (bloc.formKey.currentState!.validate()) {}
      },
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
          haveTittle: false,
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
          decoration: textInputDecoration(
            isFilled: true,
            hintText: "Enter Email",
            fillColor: Colors.white.withOpacity(0.1),
            colorBorder: Colors.transparent,
            enableColorBorder: Colors.transparent,
          ),
        ),
        tittleAndTextField(
          controller: bloc.usernameController,
          style: textNormal(color: neutral30),
          haveTittle: false,
          onChange: (value) {
            setState(() {
              if (bloc.errorMessage != '') bloc.errorMessage = '';
            });
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Username must be filled out !";
            }
          },
          decoration: textInputDecoration(
            isFilled: true,
            hintText: "Create Username",
            fillColor: Colors.white.withOpacity(0.1),
            colorBorder: Colors.transparent,
            enableColorBorder: Colors.transparent,
          ),
        ),
        tittleAndTextField(
          controller: bloc.passwordController,
          haveTittle: false,
          isPassword: bloc.isPassword,
          style: textNormal(color: neutral30),
          onChange: (value) {
            setState(() {
              if (bloc.errorMessage != '') {
                bloc.errorMessage = '';
              }
            });
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Password must be filled out !";
            } else if (value.length < 8) {
              return "Password must be longer than or equal to 8 characters !";
            }
            return null;
          },
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
        ),
        tittleAndTextField(
          controller: bloc.confirmPasswordController,
          haveTittle: false,
          isPassword: bloc.isPassword,
          style: textNormal(color: neutral30),
          onChange: (value) {
            setState(() {
              if (bloc.errorMessage != '') {
                bloc.errorMessage = '';
              }
            });
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
        ),
      ],
    );
  }

  Widget renderScreen(BuildContext context) {
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
          renderButton(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContainerForm(
      body: renderScreen(context),
      bottom: renderLoginButton(),
    );
  }
}
