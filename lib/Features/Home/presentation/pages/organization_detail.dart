import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gsoc_organizations/Features/Home/presentation/widgets/organization_content.dart';
import 'package:gsoc_organizations/Utilities/constants.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: bgColor,
        iconTheme: const IconThemeData(color: blackColor),
        elevation: 0,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Hero(
              tag: widget.gsocOrganization.name,
              child: Image.network(
                widget.gsocOrganization.image_url,
                width: 70.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(child: OrganizationContent(widget.gsocOrganization))
          ],
        ),
      ),
    );
  }
}
