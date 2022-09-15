// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashView());
    },
    OnBoardingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OnBoardingView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: 'splashView', fullMatch: true),
        RouteConfig(SplashRoute.name, path: 'splashView'),
        RouteConfig(OnBoardingRoute.name, path: 'onboardView')
      ];
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: 'splashView');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [OnBoardingView]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: 'onboardView');

  static const String name = 'OnBoardingRoute';
}
