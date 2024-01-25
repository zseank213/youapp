import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

class AppBarWidget extends StatelessWidget {
  final ProfileCubit bloc;

  const AppBarWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: neutral30,
                ),
                AppDimens.horizontalSpace6,
                Text(
                  "Back",
                  style: textNormal(color: neutral30),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "@${bloc.dataProfile?.data?.username}",
                style: textNormal(color: neutral30),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: PopupMenuButton<String>(
                color: neutral30,
                onSelected: (value) async {
                  switch (value) {
                    case 'Logout':
                      await SecureStorage.deleteAccessToken();
                      Navigator.pushReplacementNamed(context, routeLogin);
                      break;
                  }
                },
                itemBuilder: (BuildContext context) {
                  return {'Logout'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
