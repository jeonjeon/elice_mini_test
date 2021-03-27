import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState(index: 0));
  void changePage(int _index) => emit(BottomNavigationState(index: _index));
}
