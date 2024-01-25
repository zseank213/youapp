import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/lib.dart';

class InterestScreen extends StatefulWidget {
  final ProfileModel data;
  final ValueSetter<List<String>> callback;

  const InterestScreen({
    super.key,
    required this.data,
    required this.callback,
  });

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  ProfileCubit bloc = ProfileCubit();

  @override
  void initState() {
    bloc.dataProfile = widget.data;
    bloc.interestSelected = widget.data.data?.interests;
    bloc.init();
    super.initState();
  }

  Widget renderContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              AppDimens.verticalSpace30,
              Text(
                "Tell everyone about yourself",
                style: textNormal(color: textColor1),
              ),
              AppDimens.verticalSpace4,
              Text(
                "What interest you?",
                style: textLarge(color: textColor0),
              ),
            ],
          ),
          AppDimens.verticalSpace30,
          if (bloc.interestSelected?.isNotEmpty ?? true) ...[
            CardWidget(
              isWhite: true,
              width: MediaQuery.of(context).size.width,
              height: bloc.interestSelected?.isNotEmpty ?? true ? null : 56,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  bloc.interestSelected!.length + 1,
                  (index) => Container(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 4, bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (index == bloc.interestSelected?.length) ...[
                          InkWell(
                            onTap: () {
                              setState(() {
                                bloc.isAdding = !bloc.isAdding;
                                FocusScope.of(context).unfocus();
                                if (bloc.isAdding) {
                                  bloc.heightInterest = 0;
                                } else {
                                  bloc.heightInterest = 56;
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Add More",
                                  style: textNormal(color: textColor0),
                                ),
                                AppDimens.horizontalSpace4,
                                const Icon(
                                  Icons.add,
                                  color: neutral30,
                                ),
                              ],
                            ),
                          ),
                        ] else ...[
                          Text(
                            "${bloc.interestSelected?[index]}",
                            style: textNormal(color: textColor0),
                          ),
                          AppDimens.horizontalSpace4,
                          InkWell(
                            onTap: () {
                              setState(() {
                                FocusScope.of(context).unfocus();
                                bloc.interestSelected?.removeAt(index);
                                if (bloc.interestSelected?.isEmpty ?? true) {
                                  bloc.isAdding = true;
                                  bloc.heightInterest = 56;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.clear,
                              color: neutral30,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AppDimens.verticalSpace24,
          ],
          AnimatedContainer(
            height: bloc.heightInterest,
            duration: const Duration(milliseconds: 500),
            child: TextFormField(
              controller: bloc.interestsController,
              style: textNormal(color: textColor0),
              validator: (value) {},
              decoration: textInputDecoration(
                isFilled: true,
                hintText: "Insert your interest",
                fillColor: Colors.white.withOpacity(0.1),
                colorBorder: Colors.transparent,
                enableColorBorder: Colors.transparent,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        if (bloc.interestsController.text.isNotEmpty) {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            bloc.interestSelected?.add(bloc.interestsController.text);
                            bloc.interestsController.clear();
                          });
                        }
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Add",
                          style: textNormal(color: textColor0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderAppBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () async {
                setState(() {
                  bloc.isAdding = false;
                  bloc.heightInterest = 0;
                });
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: neutral30,
                  ),
                  Text(
                    'Back',
                    style: textNormal(color: textColor0),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                bloc.createProfile();
              },
              child: Text(
                "Save",
                style: textMedium(color: textColor2),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderScreen() {
    return ContainerForm(
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is OnSuccessCreateProfile) {
              setState(() {
                widget.callback(bloc.interestSelected ?? []);
                Navigator.pop(context);
              });
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              renderAppBar(),
              renderContent(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return renderScreen();
  }
}
