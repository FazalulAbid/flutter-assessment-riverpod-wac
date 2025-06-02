import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assessment/main/app.dart';
import 'package:flutter_assessment/main/app_env.dart';
import 'package:flutter_assessment/main/observers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(ProviderScope(observers: [Observers()], child: MyApp()));
}