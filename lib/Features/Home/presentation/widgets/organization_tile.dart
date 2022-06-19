import 'package:flutter/material.dart';
import 'package:gsoc_organizations/Features/Home/data/models/gsoc_organization.dart';

class OrganizationTile extends StatelessWidget {
  final GsocOrganization gsocOrganization;
  const OrganizationTile({Key? key, required this.gsocOrganization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            gsocOrganization.image_url,
            width: 25,
            height: 25,
            fit: BoxFit.cover,
          ),
          FittedBox(child: Text(gsocOrganization.name))
        ],
      ),
    );
  }
}
