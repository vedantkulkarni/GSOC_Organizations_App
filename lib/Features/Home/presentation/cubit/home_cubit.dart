import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:gsoc_organizations/Features/Home/data/models/gsoc_organization.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getAllOrganizations();
  }

  List<GsocOrganization> _organizations = [];

  Future<void> getAllOrganizations() async {
    var response =
        await Dio().get("https://api.gsocorganizations.dev/organizations.json");
    print(response.data[0].runtimeType);
    await parseJsonResponseToObject(response.data);
    emit(AllOrganizationsState());
  }

  Future<void> parseJsonResponseToObject(
      List<dynamic> data) async {
    List<GsocOrganization> _tempList = [];
    for (var everyOrganization in data) {
      final GsocOrganization organization =
          GsocOrganization.fromJson(everyOrganization);
      _tempList.add(organization);
    }

    _organizations = _tempList;
  }

  //getter
  List<GsocOrganization> get organizationsList {
    return [..._organizations];
  }
}
