import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

class ContainerForm extends StatelessWidget {
  final Widget body;
  final Widget? bottom;
  final Color? bgColor;

  const ContainerForm({super.key, required this.body, this.bottom, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              bgColor == null
                  ? Image.asset(
                      bgPrimary,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    )
                  : Container(
                      color: bgColor,
                    ),
              Positioned(
                bottom: 0,
                right: 20,
                left: 20,
                top: 0,
                child: body,
              ),
              Positioned(
                bottom: MediaQuery.of(context).padding.bottom + 25,
                right: 20,
                left: 20,
                child: bottom ?? Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
