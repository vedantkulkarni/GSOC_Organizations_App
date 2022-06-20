import 'package:flutter/material.dart';
import 'package:gsoc_organizations/Features/Home/presentation/widgets/organization_content.dart';

import '../../data/models/gsoc_organization.dart';

class OrganizationDetail extends StatefulWidget {
  final GsocOrganization gsocOrganization;
  const OrganizationDetail({Key? key, required this.gsocOrganization})
      : super(key: key);

  @override
  State<OrganizationDetail> createState() => _OrganizationDetialState();
}

class _OrganizationDetialState extends State<OrganizationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            const SizedBox(
              height: 20,
            ),
            Hero(
              tag: widget.gsocOrganization.name,
              child: Image.network(
                widget.gsocOrganization.image_url,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: OrganizationContent(widget.gsocOrganization))
          ],
        ),
      ),
    );
  }
}
