import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gsoc_organizations/Features/Home/data/models/gsoc_organization.dart';
import 'package:gsoc_organizations/Features/Home/presentation/pages/organization_detail.dart';
import 'package:gsoc_organizations/Utilities/constants.dart';

class OrganizationTile extends StatelessWidget {
  final GsocOrganization gsocOrganization;
  const OrganizationTile({Key? key, required this.gsocOrganization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                OrganizationDetail(gsocOrganization: gsocOrganization)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.all(4.0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: gsocOrganization.name,
              child: Image.network(
                gsocOrganization.image_url,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
            FittedBox(
                child: Text(
              gsocOrganization.name,
              style:
                  nunito.copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ))
          ],
        ),
      ),
    );
  }
}
