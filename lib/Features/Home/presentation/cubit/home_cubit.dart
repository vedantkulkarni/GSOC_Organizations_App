import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:gsoc_organizations/Features/Home/data/repositories/gsoc_repository_data_layer.dart';
import 'package:gsoc_organizations/Features/Home/domain/repositories/gsoc_repository_domain_layer.dart';
import 'package:gsoc_organizations/Features/Home/domain/usecases/get_all_organizations_usecase.dart';

import '../../data/models/gsoc_organization.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getAllOrganizations();
  }

  List<GsocOrganization> _allOrganizations = [];
  List<GsocOrganization> _searchedOrganizations = [];

  Future<void> getAllOrganizations() async {
    final GSOCRepositoryDomainLayer _gsocRepositoryDomainLayer =
        GSOCRepositoryDataLayer();//init repository object.
    final GetAllOrganizationsUseCase _getAllOrganizationsUseCase = GetAllOrganizationsUseCase(_gsocRepositoryDomainLayer);//init usecase object.
    _getAllOrganizationsUseCase.getAllOrganizations();//perform specfic function on use case.
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

    if (_searchedOrganizations.isEmpty) {
      _searchedOrganizations.addAll(_allOrganizations.where((element) {
        return element.techList.any(
              (element) => element.toString().startsWith(value),
            ) ||
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
