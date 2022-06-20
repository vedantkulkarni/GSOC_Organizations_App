import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:gsoc_organizations/Features/Home/presentation/cubit/home_cubit.dart';
import 'package:gsoc_organizations/Features/Home/presentation/widgets/drawer.dart';
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
      drawer: const Drawer(
        child: GsocDrawer(),
      ),
      appBar: searchBar.build(context),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              children: [
                const Expanded(child: OrganizationGridView()),
                Container(
                  margin: EdgeInsets.only(top: 20.h, bottom: 5.h),
                  child: Center(
                      child: Text(
                    "Built with ❤️ by Vedant Kulkarni",
                    style: nunito.copyWith(fontSize: 14.sp),
                  )),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  late SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: const IconThemeData(color: blackColor),
      elevation: 0,
      backgroundColor: bgColor,
      title: SizedBox(
        height: 50.h,
        width: 50.w,
        child: gsocLogo, //Can be found in constants.dart
      ),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  @override
  void initState() {
    searchBar = SearchBar(
        inBar: false,
        setState: setState,
        closeOnSubmit: false,
        hintText: 'Search organizations, technologies or topics',
        buildDefaultAppBar: buildAppBar,
        onChanged: onChanged,
        onClosed: onClosed);
    super.initState();
  }

  //related functions
  void onChanged(String value) {
    BlocProvider.of<HomeCubit>(context).userSearched(value);
  }

  void onClosed() {
    BlocProvider.of<HomeCubit>(context).closeSearch();
  }
}
