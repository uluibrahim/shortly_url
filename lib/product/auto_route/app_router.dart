import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/onboarding/view/onboarding_view.dart';
import '../../features/splash/view/splash_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashView,
      path: "splashView",
      initial: true,
    ),
    AutoRoute(page: OnBoardingView, path: "onboardView"),
  ],
)
class AppRouter extends _$AppRouter {}
