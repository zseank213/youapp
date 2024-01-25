import 'package:flutter/material.dart';
import 'package:youapp/lib.dart';

class SkeletonProfileWidget extends StatelessWidget {
  const SkeletonProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
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
                    child: SizedBox(
                      height: 16,
                      width: MediaQuery.of(context).size.width / 3,
                      child: const ShimmerEffect(
                        borderRadius: 8,
                      ),
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
          ),
          AppDimens.verticalSpace24,
          const SizedBox(
            height: 190,
            child: ShimmerEffect(
              borderRadius: 16,
            ),
          ),
          AppDimens.verticalSpace24,
          const SizedBox(
            height: 120,
            child: ShimmerEffect(),
          ),
          AppDimens.verticalSpace12,
          const SizedBox(
            height: 120,
            child: ShimmerEffect(),
          ),
        ],
      ),
    );
  }
}
