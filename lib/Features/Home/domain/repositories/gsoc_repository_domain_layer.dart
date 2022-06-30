import '../../data/models/gsoc_organization.dart';

abstract class GSOCRepositoryDomainLayer {
  Future<List<GsocOrganization>> getAllOrganizations();
}
