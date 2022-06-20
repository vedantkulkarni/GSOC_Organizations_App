import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gsoc_organizations/Features/Home/presentation/widgets/project_tile.dart';
import 'package:gsoc_organizations/Utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/gsoc_organization.dart';

class OrganizationContent extends StatefulWidget {
  final GsocOrganization gsocOrganization;
  const OrganizationContent(
    this.gsocOrganization, {
    Key? key,
  }) : super(key: key);

  @override
  State<OrganizationContent> createState() => _OrganizationContentState();
}

class _OrganizationContentState extends State<OrganizationContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: 50.0.h,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              Container(
                padding: EdgeInsets.all(8.h),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.gsocOrganization.name,
                      style: headingStyle.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      widget.gsocOrganization.description,
                      style: nunito.copyWith(color: blackColor),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.h),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Technologies",
                      style: nunito.copyWith(color: greyColor),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      widget.gsocOrganization.technologies.toString(),
                      style:
                          nunito.copyWith(color: blackColor, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Topics",
                      style: nunito.copyWith(color: greyColor),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      widget.gsocOrganization.topics.toString(),
                      style:
                          nunito.copyWith(color: blackColor, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Links",
                      style: nunito.copyWith(color: greyColor, fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchUrl(widget.gsocOrganization.url);
                      },
                      child: Text(
                        widget.gsocOrganization.url,
                        style:
                            nunito.copyWith(color: blueColor, fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      "Projects",
                      style: nunito.copyWith(color: greyColor, fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return ProjectTile(
                          widget.gsocOrganization.allProjects[index]);
                    }),
                    itemCount: widget.gsocOrganization.allProjects.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
