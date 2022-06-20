

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gsoc_organizations/Features/Home/presentation/cubit/home_cubit.dart';
import 'Features/Home/presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: ScreenUtilInit(
       designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:(context,child)=>  MaterialApp(home: HomeScreen()),
      ),
    );
  }
}
