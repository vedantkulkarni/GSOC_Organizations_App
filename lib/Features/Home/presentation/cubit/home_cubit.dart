import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/gsoc_organization.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getAllOrganizations();
  }

  List<GsocOrganization> _allOrganizations = [];
  List<GsocOrganization> _searchedOrganizations = [];

  Future<void> getAllOrganizations() async {
    var response =
        await Dio().get("https://api.gsocorganizations.dev/organizations.json");
    print(response.data[0].runtimeType);
    await parseJsonResponseToObject(response.data);
    emit(AllOrganizationsState());
  }

  Future<void> parseJsonResponseToObject(List<dynamic> data) async {
    List<GsocOrganization> _tempList = [];
    for (var everyOrganization in data) {
      final GsocOrganization organization =
          GsocOrganization.fromJson(everyOrganization);
      _tempList.add(organization);
    }

    _allOrganizations = _tempList;
  }

  void closeSearch() {
    emit(AllOrganizationsState());
  }

  void userSearched(String value) {
    _searchedOrganizations = [];
    _searchedOrganizations.addAll(_allOrganizations.where((element) {
      return element.name.toLowerCase().startsWith(value.toLowerCase());
    }).toList());

    if(_searchedOrganizations.isEmpty)
    {
      _searchedOrganizations.addAll(_allOrganizations.where((element) {
      return element.techList.any(
        (element) => element.toString().startsWith(value),
        
      )||
      element.topicsList
          .any((element) => element.toString().startsWith(value));
    }));
    }

    

    emit(SearchTriggered(value));
  }

  //getter
  List<GsocOrganization> get organizationsList {
    return state is SearchTriggered
        ? [..._searchedOrganizations]
        : [..._allOrganizations];
  }
}
