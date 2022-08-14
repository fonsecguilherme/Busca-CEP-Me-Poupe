import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/searchedZip/searched_zip_cubit.dart';
import '../../logic/searchedZip/searched_zip_state.dart';
import '../../style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchedZipCubit(),
      child: SafeArea(
        child: _buildScreen(),
      ),
    );
  }

  Stack _buildScreen() => Stack(
        children: [
          _makeImage(),
          _makeTitleText(),
          container(),
        ],
      );

  Widget container() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _makeCounterWidget(),
          _savedZipsBar(),
        ],
      );

  Padding _makeTitleText() => const Padding(
        padding: EdgeInsets.only(
          top: 15,
          left: 32,
        ),
        child: Text(
          'Olá,\nBem-vindo',
          style: Style.largerTextStyleBlack,
          textAlign: TextAlign.left,
        ),
      );

  Expanded _makeImage() => const Expanded(
        child: Image(
          image: AssetImage('assets/images/homeScreenAsset.png'),
        ),
      );

  Container _makeCounterWidget() => Container(
        height: 150,
        width: 150,
        decoration: const BoxDecoration(
          color: Style.purpleColor,
          shape: BoxShape.circle,
        ),
        child: Expanded(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Image(
                    width: 35,
                    height: 35,
                    image: AssetImage('assets/images/lilacSignIcon.png')),
              ),
              BlocBuilder<SearchedZipCubit, SearchedZipState>(
                builder: (context, state) {
                  return Text(
                    '${state.counterValue}',
                    style: Style.homeCircleText01,
                  );
                },
              ),
              const Text(
                'CEPs pesquisados',
                style: Style.homeCircleText02,
              ),
            ],
          ),
        ),
      );

  Padding _savedZipsBar() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Style.lightLilacColor,
            borderRadius: BorderRadius.circular(45.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const <Widget>[
                    Icon(
                      Icons.bookmark_border_rounded,
                      color: Color(0XFFB4A5FD),
                    ),
                    Text(
                      'CEPs salvos',
                      style: Style.homeSavedZipsText,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Style.purpleColor,
                      shape: BoxShape.circle,
                    ),
                    child: BlocBuilder<SearchedZipCubit, SearchedZipState>(
                      builder: (context, state) {
                        return Text(
                          textAlign: TextAlign.center,
                          '${state.counterValue}',
                          style: Style.searcBarCounter,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
