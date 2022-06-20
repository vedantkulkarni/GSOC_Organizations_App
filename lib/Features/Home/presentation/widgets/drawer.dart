import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gsoc_organizations/Utilities/constants.dart';

class GsocDrawer extends StatefulWidget {
  const GsocDrawer({Key? key}) : super(key: key);

  @override
  State<GsocDrawer> createState() => _GsocDrawerState();
}

class _GsocDrawerState extends State<GsocDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8.h),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Image.asset(
              "assets/images/logo1.png",
              width: 200.w,
            ),
            Expanded(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(4.h),
                height: 60.h,
                child: Center(
                  child: Text(
                    indexToYearConverterFunc(index),
                    style: headingStyle,
                  ),
                ),
              ),
              itemCount: 4,
            ))
          ],
        ),
      ),
    );
  }

  String indexToYearConverterFunc(int index) {
    return (2022 - index).toString();
  }
}
