import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gsoc_organizations/Utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectTile extends StatelessWidget {
  final Map<String, dynamic> project;
  const ProjectTile(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      padding: EdgeInsets.all(10.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contributor',
                    style: nunito.copyWith(color: greyColor, fontSize: 14.sp),
                  ),
                  Text(
                    project["student_name"],
                    style: headingStyle.copyWith(
                        fontSize: 20.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        _launchUrl(project["code_url"]);
                      },
                      child:  Text("View Code",
                      style: nunito.copyWith( fontSize: 12.sp),),),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                      onPressed: () {
                        _launchUrl(project["project_url"]);
                      },
                      icon: Icon(
                        Icons.ios_share_rounded,
                        size: 20.sp,
                      ))
                ],
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            project["title"],
            style: nunito.copyWith(
                color: blackColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            project["short_description"],
            style: nunito.copyWith(
                color: blackColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  void _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
