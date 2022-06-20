import 'package:flutter/material.dart';
import 'package:gsoc_organizations/Utilities/constants.dart';

class ProjectTile extends StatelessWidget {
  final Map<String, dynamic> project;
  const ProjectTile(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                    style: nunito.copyWith(color: greyColor, fontSize: 14),
                  ),
                  Text(
                    project["student_name"],
                    style: headingStyle.copyWith(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Spacer(),
              Row(
                children: const [
                  Icon(Icons.code_rounded),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.ios_share_rounded,
                    size: 20,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            project["title"],
            style: nunito.copyWith(
                color: blackColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            project["short_description"],
            style: nunito.copyWith(
                color: blackColor, fontSize: 14, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
