import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procura_cep/logic/navigation/constants/nav_bar_items.dart';
import 'package:procura_cep/view/screens/home_screen.dart';
import 'package:procura_cep/view/screens/saved_zips_screen.dart';
import 'package:procura_cep/view/screens/zip_search_screen.dart';

import '../../logic/navigation/navigation_cubit.dart';
import '../../logic/navigation/navigation_state.dart';
import '../../style.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  RootScreenState createState() => RootScreenState();
}

class RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return _buildBottomAppBar(state);
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navBarItem == NavBarItem.home) {
            return const HomeScreen();
          } else if (state.navBarItem == NavBarItem.search) {
            return const ZipSearchScreen();
          } else if (state.navBarItem == NavBarItem.favorites) {
            return const SavedZipsScreen();
          }
          return Container();
        },
      ),
    );
  }

  BottomNavigationBar _buildBottomAppBar(NavigationState state) =>
      BottomNavigationBar(
        currentIndex: state.index,
        selectedItemColor: Style.purpleColor,
        iconSize: 20,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 0,
        selectedLabelStyle: Style.bottomAppBarFontPurple,
        unselectedLabelStyle: Style.bottomAppBarFontGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/greySignIcon.png'),
              width: 20,
              height: 20,
            ),
            activeIcon: Image(
              image: AssetImage('assets/images/purpleSignIcon.png'),
              width: 20,
              height: 20,
            ),
            label: 'Procurar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.star,
            ),
            label: 'Favoritos',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            BlocProvider.of<NavigationCubit>(context)
                .getNavBarItem(NavBarItem.home);
          } else if (index == 1) {
            BlocProvider.of<NavigationCubit>(context)
                .getNavBarItem(NavBarItem.search);
          } else if (index == 2) {
            BlocProvider.of<NavigationCubit>(context)
                .getNavBarItem(NavBarItem.favorites);
          }
        },
      );
}
