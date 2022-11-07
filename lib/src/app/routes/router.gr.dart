// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../features/add_order/presentation/widgets/add_orders_page.dart'
    as _i5;
import '../../features/login/presentation/widgets/login_page.dart' as _i2;
import '../../features/main/main_page.dart' as _i3;
import '../../features/orders_list/presentation/widgets/orders_list_page.dart'
    as _i4;
import '../../features/settings_page/setting_page.dart' as _i6;
import '../../features/splash/splash_page.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashAppRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginPageAppRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    MainAppRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainPage(),
      );
    },
    OrdersListPageAppRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.OrdersListPage(),
        maintainState: false,
      );
    },
    AddOrdersPageAppRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AddOrdersPage(),
        maintainState: false,
      );
    },
    SettingsPageAppRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SettingsPage(),
        maintainState: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashAppRouter.name,
          path: '/',
        ),
        _i7.RouteConfig(
          LoginPageAppRouter.name,
          path: 'loginPage',
        ),
        _i7.RouteConfig(
          MainAppRouter.name,
          path: 'main',
          children: [
            _i7.RouteConfig(
              OrdersListPageAppRouter.name,
              path: 'OrdersListPage',
              parent: MainAppRouter.name,
            ),
            _i7.RouteConfig(
              AddOrdersPageAppRouter.name,
              path: 'AddOrdersPage',
              parent: MainAppRouter.name,
            ),
            _i7.RouteConfig(
              SettingsPageAppRouter.name,
              path: 'SettingsPage',
              parent: MainAppRouter.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashAppRouter extends _i7.PageRouteInfo<void> {
  const SplashAppRouter()
      : super(
          SplashAppRouter.name,
          path: '/',
        );

  static const String name = 'SplashAppRouter';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageAppRouter extends _i7.PageRouteInfo<void> {
  const LoginPageAppRouter()
      : super(
          LoginPageAppRouter.name,
          path: 'loginPage',
        );

  static const String name = 'LoginPageAppRouter';
}

/// generated route for
/// [_i3.MainPage]
class MainAppRouter extends _i7.PageRouteInfo<void> {
  const MainAppRouter({List<_i7.PageRouteInfo>? children})
      : super(
          MainAppRouter.name,
          path: 'main',
          initialChildren: children,
        );

  static const String name = 'MainAppRouter';
}

/// generated route for
/// [_i4.OrdersListPage]
class OrdersListPageAppRouter extends _i7.PageRouteInfo<void> {
  const OrdersListPageAppRouter()
      : super(
          OrdersListPageAppRouter.name,
          path: 'OrdersListPage',
        );

  static const String name = 'OrdersListPageAppRouter';
}

/// generated route for
/// [_i5.AddOrdersPage]
class AddOrdersPageAppRouter extends _i7.PageRouteInfo<void> {
  const AddOrdersPageAppRouter()
      : super(
          AddOrdersPageAppRouter.name,
          path: 'AddOrdersPage',
        );

  static const String name = 'AddOrdersPageAppRouter';
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsPageAppRouter extends _i7.PageRouteInfo<void> {
  const SettingsPageAppRouter()
      : super(
          SettingsPageAppRouter.name,
          path: 'SettingsPage',
        );

  static const String name = 'SettingsPageAppRouter';
}
