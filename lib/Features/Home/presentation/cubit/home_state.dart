part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();

 
}

class HomeInitial extends HomeState {}

class AllOrganizationsState extends HomeState {}

class SearchTriggered extends HomeState {
  final String searchValue;
  SearchTriggered(this.searchValue);
}
