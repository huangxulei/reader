// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freader/common/personal/constants.dart';
import 'package:freader/layout/home_page.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:freader/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// app 先看是否登录，没有，跳转到 login_screen；已登录，则到home_page。
/// home_page 展示两个底部导航栏在线内容context_online，本地内容context_local，默认展示第一个
///    context_online 的tab显示的page有 news、image、tools
///    context_local 的tab显示的page有 markdown、pdf、txt
///       这两者还带上同一个drawer抽屉组件，也在appbar中显示网络状态

class FreaderApp extends StatelessWidget {
  const FreaderApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640), // 1080p / 3 ,单位dp
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, widget) {
        return MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          title: 'freader',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('zh', 'CH'),
            Locale('en', 'US'),
          ],
          locale: const Locale('zh'),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
