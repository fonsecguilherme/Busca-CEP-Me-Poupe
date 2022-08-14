import 'package:equatable/equatable.dart';
import 'package:procura_cep/logic/navigation/constants/nav_bar_items.dart';

class NavigationState extends Equatable {
  final NavBarItem navBarItem;
  final int index;

  const NavigationState(this.navBarItem, this.index);

  @override
  List<Object> get props => [
        navBarItem,
        index,
      ];
}
