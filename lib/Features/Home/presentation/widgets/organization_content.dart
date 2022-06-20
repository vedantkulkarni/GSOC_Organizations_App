import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gsoc_organizations/Features/Home/presentation/widgets/project_tile.dart';
import 'package:gsoc_organizations/Utilities/constants.dart';

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
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              Text(
                widget.gsocOrganization.name,
                style: headingStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.gsocOrganization.description,
                style: nunito.copyWith(color: blackColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Technologies",
                      style: nunito.copyWith(color: greyColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.gsocOrganization.technologies.toString(),
                      style: nunito.copyWith(color: blackColor, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Topics",
                      style: nunito.copyWith(color: greyColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.gsocOrganization.topics.toString(),
                      style: nunito.copyWith(color: blackColor, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Link",
                      style: nunito.copyWith(color: greyColor, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.gsocOrganization.url,
                      style: nunito.copyWith(color: blueColor, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Projects",
                      style: nunito.copyWith(color: greyColor, fontSize: 16),
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
}
