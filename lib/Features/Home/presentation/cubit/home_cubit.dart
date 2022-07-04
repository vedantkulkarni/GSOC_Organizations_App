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
  List<GsocOrganization> _searchedOrganizations = [];//filtered list of searched organizations.

  Future<void> getAllOrganizations() async {
    final GSOCRepositoryDomainLayer _gsocRepositoryDomainLayer =
        GSOCRepositoryDataLayer();//init repository object.
    final GetAllOrganizationsUseCase _getAllOrganizationsUseCase = GetAllOrganizationsUseCase(_gsocRepositoryDomainLayer);//init usecase object.
    _allOrganizations = await _getAllOrganizationsUseCase.getAllOrganizations();//perform specfic function on use case.
    emit(AllOrganizationsState());
  }

  Future<void> getOrganizationsByYear() async{} //To be implemented as a challenge, by you.
 

  void closeSearch() {
    emit(AllOrganizationsState());//Display all the organizations on home screen again when user closes search.
  }




  //search funciton.
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
