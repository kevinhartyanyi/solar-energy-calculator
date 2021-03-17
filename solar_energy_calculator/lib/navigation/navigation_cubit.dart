import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:solar_energy_calculator/router/my_router.dart';

enum NavTab { calculator, manage, settings }

class NavigationCubit extends Cubit<NavTab> {
  NavigationCubit() : super(NavTab.calculator);

  static final _log = Logger("NavigationCubit");

  void changeTab(NavTab tab) {
    _log.finest("change tab");
    emit(tab);
  }

  List<TitledNavigationBarItem> getBottomNavigationItems(ThemeData theme) {
    final List<TitledNavigationBarItem> re = [];
    for (var i = 0; i < tabs.length; i++) {
      final tab = tabs[NavTab.values[i]];
      re.add(
        TitledNavigationBarItem(
            title: Text(tab.name),
            icon: tab.icon,
            backgroundColor: theme.primaryColor),
      );
    }
    return re;
  }

  static const Map<NavTab, NavigationTab> tabs = {
    NavTab.calculator: NavigationTab(
      name: "Calculator",
      icon: MdiIcons.mapOutline,
      initialRoute: Routes.calculatorPage,
    ),
    NavTab.manage: NavigationTab(
      name: "Saved",
      icon: MdiIcons.formatListBulleted,
      initialRoute: Routes.managePage,
    ),
    NavTab.settings: NavigationTab(
      name: "Settings",
      icon: MdiIcons.cogOutline,
      initialRoute: Routes.settingsPage,
    ),
  };
}

@immutable
class NavigationTab {
  const NavigationTab({
    this.name,
    this.icon,
    this.initialRoute,
  });

  final String name;
  final IconData icon;
  final String initialRoute;
}
