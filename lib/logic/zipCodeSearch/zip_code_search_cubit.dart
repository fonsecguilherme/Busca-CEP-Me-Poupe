import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/via_cep_network.dart';
import 'zip_code_search_state.dart';

class ZipCodeCubit extends Cubit<ZipCodeSearchState> {
  ZipCodeCubit(this._network) : super(ZipCodeSearchState.initial());

  final ViaCepNetwork _network;
}
