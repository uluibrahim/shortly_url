import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shortly_url/product/auto_route/app_router.dart';
import 'core/constants/app/application_constants.dart';
import 'core/init/theme/ligth/app_theme_ligth.dart';

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: ApplicationConstants.supportedLocale,
      path: ApplicationConstants.langAssetPath,
      startLocale: ApplicationConstants.trLocale,
      fallbackLocale: ApplicationConstants.trLocale,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      title: ApplicationConstants.appName,
      theme: AppThemeLight.instance.theme,
    );
  }
}
