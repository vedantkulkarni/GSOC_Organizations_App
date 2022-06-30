import 'package:dio/dio.dart';
import 'package:gsoc_organizations/Features/Home/domain/repositories/gsoc_repository_domain_layer.dart';

import '../models/gsoc_organization.dart';

class GSOCRepositoryDataLayer implements GSOCRepositoryDomainLayer {
  @override
  Future<List<GsocOrganization>> getAllOrganizations() async {
    var response =
        await Dio().get("https://api.gsocorganizations.dev/organizations.json");
    final List<GsocOrganization> _orgList =
        await parseJsonResponseToObject(response.data);
    return _orgList;
  }

  //function to parse received data
  Future<List<GsocOrganization>> parseJsonResponseToObject(
      List<dynamic> data) async {
    List<GsocOrganization> _tempList = [];
    for (var everyOrganization in data) {
      final GsocOrganization organization =
          GsocOrganization.fromJson(everyOrganization);
      _tempList.add(organization);
    }

    return _tempList;
  }
}
