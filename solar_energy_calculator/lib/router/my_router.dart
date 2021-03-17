import 'package:auto_route/auto_route_annotations.dart';
import 'package:solar_energy_calculator/analyze/view/analyze_page.dart';
import 'package:solar_energy_calculator/calculator/view/calculator_page.dart';
import 'package:solar_energy_calculator/manage/manage_page.dart';
import 'package:solar_energy_calculator/root/view/root_page.dart';
import 'package:solar_energy_calculator/settings/settings_page.dart';

export 'my_router.gr.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: RootPage),
    MaterialRoute(page: CalculatorPage),
    MaterialRoute(page: AnalyzePage),
    MaterialRoute(page: ManagePage),
    MaterialRoute(page: SettingsPage),
  ],
)
class $MyRouter {}
