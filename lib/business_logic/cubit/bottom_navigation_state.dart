part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  final int index;
  BottomNavigationState({required this.index});

  @override
  List<Object?> get props => [index];
}
