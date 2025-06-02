import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/presentation/screens/main_screen.dart';
import 'package:flutter_assessment/core/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => _buildApp(),
    );
  }

  Widget _buildApp() {
    return MaterialApp(
      title: 'Flutter Assessment',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => const MainScreen()},
    );
  }
}
