import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procura_cep/logic/searchedZip/searched_zip_state.dart';

class SearchedZipCubit extends Cubit<SearchedZipState> {
  SearchedZipCubit() : super(SearchedZipState(counterValue: 0));
}