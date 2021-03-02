import 'package:auto_route/auto_route_annotations.dart';
import 'package:green_energy/calculator/view/calculator_page.dart';
import 'package:green_energy/home/view/home_page.dart';
import 'package:green_energy/root/view/root_page.dart';

export 'my_router.gr.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: RootPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: CalculatorPage),
  ],
)
class $MyRouter {}
