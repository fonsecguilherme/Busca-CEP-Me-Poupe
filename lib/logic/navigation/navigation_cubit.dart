import 'package:bloc/bloc.dart';
import 'constants/nav_bar_items.dart';
import 'navigation_state.dart';


class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavBarItem.home, 0));

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.home:
        emit(const NavigationState(NavBarItem.home, 0));
        break;
      case NavBarItem.search:
        emit(const NavigationState(NavBarItem.search, 1));
        break;
      case NavBarItem.favorites:
        emit(const NavigationState(NavBarItem.favorites, 2));
        break;
      default:
    }
  }
}
