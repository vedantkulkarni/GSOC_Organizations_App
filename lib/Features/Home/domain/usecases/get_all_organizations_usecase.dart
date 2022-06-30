import 'package:gsoc_organizations/Features/Home/domain/repositories/gsoc_repository_domain_layer.dart';

import '../../data/models/gsoc_organization.dart';

class GetAllOrganizationsUseCase {
  final GSOCRepositoryDomainLayer _gsocRepositoryDomainLayer;
  GetAllOrganizationsUseCase(this._gsocRepositoryDomainLayer);
  Future<List<GsocOrganization>> getAllOrganizations() async {
    return await _gsocRepositoryDomainLayer.getAllOrganizations();
  }
}
