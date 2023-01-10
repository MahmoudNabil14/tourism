import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/business_logic/search_cubit/search_states.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit():super(InitialState());

  static SearchCubit get(context) => BlocProvider.of(context);
  List<Map<String, dynamic>> searchedList =[];

  void searchInListOfItems({required List<Map<String, dynamic>> searchedList}){
    this.searchedList = searchedList;
    emit(SearchInListState());
  }
}