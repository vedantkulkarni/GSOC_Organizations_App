import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsoc_organizations/Features/Home/presentation/cubit/home_cubit.dart';
import 'package:gsoc_organizations/Features/Home/presentation/widgets/organizations_grid_view.dart';

import '../../../../Utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Widget _homeWidget = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const Drawer(),
      appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: blackColor),
          elevation: 0,
          backgroundColor: bgColor,
          title: SizedBox(
            height: 50,
            width: 50,
            child: gsocLogo, //Can be found in constants.dart
          )),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: OrganizationGridView(),
          );
        },
      ),
    );
  }
}
