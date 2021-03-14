import 'package:auto_route/auto_route_annotations.dart';
import 'package:green_energy/analyze/view/analyze_page.dart';
import 'package:green_energy/calculator/view/calculator_page.dart';
import 'package:green_energy/home/view/home_page.dart';
import 'package:green_energy/manage/manage_page.dart';
import 'package:green_energy/root/view/root_page.dart';
import 'package:green_energy/settings/settings_page.dart';

export 'my_router.gr.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: RootPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: CalculatorPage),
    MaterialRoute(page: AnalyzePage),
    MaterialRoute(page: ManagePage),
    MaterialRoute(page: SettingsPage),
  ],
)
class $MyRouter {}
