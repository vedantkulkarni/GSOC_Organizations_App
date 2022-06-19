import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gsoc_organizations/Features/Home/presentation/cubit/home_cubit.dart';
import 'package:gsoc_organizations/Features/Home/presentation/widgets/organization_tile.dart';

class OrganizationGridView extends StatefulWidget {
  const OrganizationGridView({Key? key}) : super(key: key);

  @override
  State<OrganizationGridView> createState() => _OrganizationGridViewState();
}

class _OrganizationGridViewState extends State<OrganizationGridView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (someBuilderContext, state) {
        if (state is HomeInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final _organizationsList =
            BlocProvider.of<HomeCubit>(context).organizationsList;
        return Container(
          child: AnimationLimiter(
            child: GridView.count(
              crossAxisCount: 4,
              physics: const BouncingScrollPhysics(),
              children: List.generate(_organizationsList.length, (index) {
                return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    columnCount: 4,
                    child: ScaleAnimation(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                          child: OrganizationTile(gsocOrganization: _organizationsList[index]),),
                    ));
              }),
            ),
          ),
        );
      },
    );
  }
}
