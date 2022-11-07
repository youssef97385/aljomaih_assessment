import 'package:aljomaih_assessment/src/features/splash/splash_page.dart';
import 'package:auto_route/auto_route.dart';

import '../../features/add_order/presentation/widgets/add_orders_page.dart';
import '../../features/intro/intro_page.dart';
import '../../features/login/presentation/widgets/login_page.dart';
import '../../features/main/main_page.dart';
import '../../features/orders_list/presentation/widgets/orders_list_page.dart';
import '../../features/settings_page/setting_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[

    AutoRoute(
      path: '/',
      name: 'splashAppRouter',
      page: SplashPage,
    ),

    AutoRoute(
      path: 'loginPage',
      name: 'loginPageAppRouter',
      page: LoginPage,
    ),

    AutoRoute(
      path: 'main',
      name: 'mainAppRouter',
      page: MainPage,
      children: [
        AutoRoute(
          path: 'OrdersListPage',
          name: 'OrdersListPageAppRouter',
          page: OrdersListPage,
          maintainState: false
        ),
 AutoRoute(
          path: 'AddOrdersPage',
          name: 'AddOrdersPageAppRouter',
          page: AddOrdersPage,
     maintainState: false
        ),

 AutoRoute(
          path: 'SettingsPage',
          name: 'SettingsPageAppRouter',
          page: SettingsPage,
     maintainState: false
        ),

      ],
    )
  ],
)
class $AppRouter {}
