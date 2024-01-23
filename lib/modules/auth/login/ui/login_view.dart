import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/lib.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginCubit cubit = LoginCubit();

  Widget renderRegisterButton() {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'No account? ',
              style: textNormal(color: textColor0),
            ),
            TextSpan(
              text: 'Register here',
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushReplacementNamed(context, routeRegister),
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
          controller: cubit.emailController,
          style: textNormal(color: neutral30),
          onChange: (value) {
            setState(() {
              if (cubit.errorMessage != '') cubit.errorMessage = '';
            });
          },
          haveTittle: false,
          validator: (value) {
            if (cubit.errorMessage != '' && cubit.errorMessage != 'Incorrect password') {
              return cubit.errorMessage;
            } else if (value!.isEmpty) {
              return "Email must be filled out !";
            }
            return null;
          },
          decoration: textInputDecoration(
            isFilled: true,
            hintText: "Enter Username/Email",
            fillColor: Colors.white.withOpacity(0.1),
            colorBorder: Colors.transparent,
            enableColorBorder: Colors.transparent,
          ),
        ),
        tittleAndTextField(
          controller: cubit.passwordController,
          haveTittle: false,
          isPassword: cubit.isPassword,
          style: textNormal(color: neutral30),
          onChange: (value) {
            setState(() {
              if (cubit.errorMessage != '') {
                cubit.errorMessage = '';
              }
            });
          },
          validator: (value) {
            if (cubit.errorMessage != '' && cubit.errorMessage != 'User not found') {
              return cubit.errorMessage;
            } else if (value!.isEmpty) {
              return "Password must be filled out !";
            } else if (value.length < 8) {
              return "Password must be longer than or equal to 8 characters !";
            }
            return null;
          },
          decoration: textInputDecoration(
            isFilled: true,
            hintText: "Enter Password",
            fillColor: Colors.white.withOpacity(0.1),
            colorBorder: Colors.transparent,
            enableColorBorder: Colors.transparent,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  cubit.isPassword = !cubit.isPassword;
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

  Widget renderButton(BuildContext context) {
    return ButtonWidget(
      text: "Login",
      onTap: () {
        if (cubit.formKey.currentState!.validate()) {
          cubit.post();
        }
      },
      isDisable: cubit.emailController.text.isNotEmpty && cubit.passwordController.text.isNotEmpty,
      hasShadow: cubit.emailController.text.isNotEmpty && cubit.passwordController.text.isNotEmpty,
      isLoading: cubit.isLoading,
    );
  }

  Widget renderScreen(BuildContext context) {
    return ContainerForm(
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (cLogin, sLogin) {
            if (sLogin is OnSuccessLogin) {
              Navigator.pushReplacementNamed(context, routeHome);
            }
          },
          builder: (cLogin, sLogin) {
            return Form(
              key: cubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppDimens.horizontalSpace12,
                      Text(
                        "Login",
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
          },
        ),
      ),
      bottom: renderRegisterButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return renderScreen(context);
  }
}
