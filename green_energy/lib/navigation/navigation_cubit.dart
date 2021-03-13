import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:green_energy/router/my_router.dart';

enum NavTab { home, calculator, manage }

class NavigationCubit extends Cubit<NavTab> {
  NavigationCubit() : super(NavTab.home);

  static final _log = Logger("NavigationCubit");

  void changeTab(NavTab tab) {
    _log.finest("change tab");
    emit(tab);
  }

  List<TitledNavigationBarItem> getBottomNavigationItems() {
    final List<TitledNavigationBarItem> re = [];
    for (var i = 0; i < tabs.length; i++) {
      final tab = tabs[NavTab.values[i]];
      re.add(
        TitledNavigationBarItem(
            title: Text(tab.name),
            icon: tab.icon,
            backgroundColor: Colors.white),
      );
    }
    return re;
  }

  static const Map<NavTab, NavigationTab> tabs = {
    NavTab.home: NavigationTab(
      name: "Home",
      icon: Icons.ac_unit,
      initialRoute: Routes.homePage,
    ),
    NavTab.calculator: NavigationTab(
      name: "Calculator",
      icon: Icons.ac_unit,
      initialRoute: Routes.calculatorPage,
    ),
    NavTab.manage: NavigationTab(
      name: "Saved",
      icon: Icons.ac_unit,
      initialRoute: Routes.managePage,
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
